package com.dlu.pojo;

import java.util.Arrays;
import java.util.Date;

public class Contract {
    private Integer id;

    private Integer houseId;

    private String contractNumber;

    private String partALoginName;

    private String partBLoginName;

    private String partAName;

    private String partBName;

    private String partATypeOfCertificate;

    private String partBTypeOfCertificate;

    private String partAIdNumber;

    private String partBIdNumber;

    private String houseOwnership;

    private String houseOwnershipCertificate;

    private String houseSourceCertificateContent;

    private String houseOwnerName;

    private String mortgage;

    private String rentalPurposes;

    private Integer people;

    private Date startDate;

    private String startDateString;

    private Date endDate;

    private String endDateString;

    private String duration;

    private Date partADeliveryTime;

    private String partADeliveryTimeString;

    private String partADeliveryCondition;

    private Integer renewal;

    private String rentPaymentTimeMethod;

    private Double monthlyRent;

    private String monthlyRentUppercase;

    private Double totalPrice;

    private String totalPriceUppercase;

    private String rentPaymentMethod;

    private String paymentDateString;


    private Double deposit;

    private String depositUppercase;

    private String partACost;

    private String partBCost;

    private Double partAIntermediaryCosts;

    private String partAIntermediaryCostsUppercase;

    private Double partBIntermediaryCosts;

    private String partBIntermediaryCostsUppercase;

    private String partAPayment;

    private String partBPayment;

    private String partAAdditionalClauses;

    private String partBAdditionalClauses;

    private Double partAPenalty;

    private Double partBPenalty;

    private Double penalty;

    private String penaltyAdditionalClauses;


    private String other;

    private String status;

    private String partAConfirm;

    private String partBConfirm;

    private String checkBy;

    private String[] partACostArray;

    private String[] partBCostArray;

    public Contract() {

    }

    public Contract(Integer houseId, String contractNumber, String partALoginName, String partBLoginName, String status) {
        this.houseId = houseId;
        this.contractNumber = contractNumber;
        this.partALoginName = partALoginName;
        this.partBLoginName = partBLoginName;
        this.status = status;
    }

    public String[] getPartACostArray() {
        return partACostArray;
    }

    public void setPartACostArray(String[] partACostArray) {
        this.partACostArray = partACostArray;
    }

    public String[] getPartBCostArray() {
        return partBCostArray;
    }

    public void setPartBCostArray(String[] partBCostArray) {
        this.partBCostArray = partBCostArray;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber == null ? null : contractNumber.trim();
    }

    public String getPartALoginName() {
        return partALoginName;
    }

    public void setPartALoginName(String partALoginName) {
        this.partALoginName = partALoginName == null ? null : partALoginName.trim();
    }

    public String getPartBLoginName() {
        return partBLoginName;
    }

    public void setPartBLoginName(String partBLoginName) {
        this.partBLoginName = partBLoginName == null ? null : partBLoginName.trim();
    }

    public String getPartAName() {
        return partAName;
    }

    public void setPartAName(String partAName) {
        this.partAName = partAName == null ? null : partAName.trim();
    }

    public String getPartBName() {
        return partBName;
    }

    public void setPartBName(String partBName) {
        this.partBName = partBName == null ? null : partBName.trim();
    }

    public String getPartATypeOfCertificate() {
        return partATypeOfCertificate;
    }

    public void setPartATypeOfCertificate(String partATypeOfCertificate) {
        this.partATypeOfCertificate = partATypeOfCertificate == null ? null : partATypeOfCertificate.trim();
    }

    public String getPartBTypeOfCertificate() {
        return partBTypeOfCertificate;
    }

    public void setPartBTypeOfCertificate(String partBTypeOfCertificate) {
        this.partBTypeOfCertificate = partBTypeOfCertificate == null ? null : partBTypeOfCertificate.trim();
    }

    public String getPartAIdNumber() {
        return partAIdNumber;
    }

    public void setPartAIdNumber(String partAIdNumber) {
        this.partAIdNumber = partAIdNumber == null ? null : partAIdNumber.trim();
    }

    public String getPartBIdNumber() {
        return partBIdNumber;
    }

    public void setPartBIdNumber(String partBIdNumber) {
        this.partBIdNumber = partBIdNumber == null ? null : partBIdNumber.trim();
    }

    public String getHouseOwnership() {
        return houseOwnership;
    }

    public void setHouseOwnership(String houseOwnership) {
        this.houseOwnership = houseOwnership == null ? null : houseOwnership.trim();
    }

    public String getHouseOwnershipCertificate() {
        return houseOwnershipCertificate;
    }

    public void setHouseOwnershipCertificate(String houseOwnershipCertificate) {
        this.houseOwnershipCertificate = houseOwnershipCertificate == null ? null : houseOwnershipCertificate.trim();
    }

    public String getHouseSourceCertificateContent() {
        return houseSourceCertificateContent;
    }

    public void setHouseSourceCertificateContent(String houseSourceCertificateContent) {
        this.houseSourceCertificateContent = houseSourceCertificateContent == null ? null : houseSourceCertificateContent.trim();
    }

    public String getHouseOwnerName() {
        return houseOwnerName;
    }

    public void setHouseOwnerName(String houseOwnerName) {
        this.houseOwnerName = houseOwnerName == null ? null : houseOwnerName.trim();
    }

    public String getMortgage() {
        return mortgage;
    }

    public void setMortgage(String mortgage) {
        this.mortgage = mortgage == null ? null : mortgage.trim();
    }

    public String getRentalPurposes() {
        return rentalPurposes;
    }

    public void setRentalPurposes(String rentalPurposes) {
        this.rentalPurposes = rentalPurposes == null ? null : rentalPurposes.trim();
    }

    public Integer getPeople() {
        return people;
    }

    public void setPeople(Integer people) {
        this.people = people;
    }


    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }


    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration == null? null :duration.trim();
    }

    public Date getPartADeliveryTime() {
        return partADeliveryTime;
    }

    public void setPartADeliveryTime(Date partADeliveryTime) {
        this.partADeliveryTime = partADeliveryTime;
    }

    public String getPartADeliveryCondition() {
        return partADeliveryCondition;
    }

    public void setPartADeliveryCondition(String partADeliveryCondition) {
        this.partADeliveryCondition = partADeliveryCondition == null ? null : partADeliveryCondition.trim();
    }

    public Integer getRenewal() {
        return renewal;
    }

    public void setRenewal(Integer renewal) {
        this.renewal = renewal;
    }

    public String getRentPaymentTimeMethod() {
        return rentPaymentTimeMethod;
    }

    public void setRentPaymentTimeMethod(String rentPaymentTimeMethod) {
        this.rentPaymentTimeMethod = rentPaymentTimeMethod == null ? null : rentPaymentTimeMethod.trim();
    }

    public Double getMonthlyRent() {
        return monthlyRent;
    }

    public void setMonthlyRent(Double monthlyRent) {
        this.monthlyRent = monthlyRent;
    }

    public String getMonthlyRentUppercase() {
        return monthlyRentUppercase;
    }

    public void setMonthlyRentUppercase(String monthlyRentUppercase) {
        this.monthlyRentUppercase = monthlyRentUppercase == null ? null : monthlyRentUppercase.trim();
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getTotalPriceUppercase() {
        return totalPriceUppercase;
    }

    public void setTotalPriceUppercase(String totalPriceUppercase) {
        this.totalPriceUppercase = totalPriceUppercase == null ? null : totalPriceUppercase.trim();
    }

    public String getRentPaymentMethod() {
        return rentPaymentMethod;
    }

    public void setRentPaymentMethod(String rentPaymentMethod) {
        this.rentPaymentMethod = rentPaymentMethod == null ? null : rentPaymentMethod.trim();
    }

    public String getPaymentDateString() {
        return paymentDateString;
    }

    public void setPaymentDateString(String paymentDateString) {
        this.paymentDateString = paymentDateString == null ? null : paymentDateString.trim();
    }


    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public String getDepositUppercase() {
        return depositUppercase;
    }

    public void setDepositUppercase(String depositUppercase) {
        this.depositUppercase = depositUppercase == null ? null : depositUppercase.trim();
    }

    public String getPartACost() {
        return partACost;
    }

    public void setPartACost(String partACost) {
        this.partACost = partACost == null ? null : partACost.trim();
    }

    public String getPartBCost() {
        return partBCost;
    }

    public void setPartBCost(String partBCost) {
        this.partBCost = partBCost == null ? null : partBCost.trim();
    }

    public Double getPartAIntermediaryCosts() {
        return partAIntermediaryCosts;
    }

    public void setPartAIntermediaryCosts(Double partAIntermediaryCosts) {
        this.partAIntermediaryCosts = partAIntermediaryCosts;
    }

    public String getPartAIntermediaryCostsUppercase() {
        return partAIntermediaryCostsUppercase;
    }

    public void setPartAIntermediaryCostsUppercase(String partAIntermediaryCostsUppercase) {
        this.partAIntermediaryCostsUppercase = partAIntermediaryCostsUppercase == null ? null : partAIntermediaryCostsUppercase.trim();
    }

    public Double getPartBIntermediaryCosts() {
        return partBIntermediaryCosts;
    }

    public void setPartBIntermediaryCosts(Double partBIntermediaryCosts) {
        this.partBIntermediaryCosts = partBIntermediaryCosts;
    }

    public String getPartBIntermediaryCostsUppercase() {
        return partBIntermediaryCostsUppercase;
    }

    public void setPartBIntermediaryCostsUppercase(String partBIntermediaryCostsUppercase) {
        this.partBIntermediaryCostsUppercase = partBIntermediaryCostsUppercase == null ? null : partBIntermediaryCostsUppercase.trim();
    }

    public String getPartAPayment() {
        return partAPayment;
    }

    public void setPartAPayment(String partAPayment) {
        this.partAPayment = partAPayment == null ? null : partAPayment.trim();
    }

    public String getPartBPayment() {
        return partBPayment;
    }

    public void setPartBPayment(String partBPayment) {
        this.partBPayment = partBPayment == null ? null : partBPayment.trim();
    }

    public String getPartAAdditionalClauses() {
        return partAAdditionalClauses;
    }

    public void setPartAAdditionalClauses(String partAAdditionalClauses) {
        this.partAAdditionalClauses = partAAdditionalClauses == null ? null : partAAdditionalClauses.trim();
    }

    public String getPartBAdditionalClauses() {
        return partBAdditionalClauses;
    }

    public void setPartBAdditionalClauses(String partBAdditionalClauses) {
        this.partBAdditionalClauses = partBAdditionalClauses == null ? null : partBAdditionalClauses.trim();
    }

    public Double getPartAPenalty() {
        return partAPenalty;
    }

    public void setPartAPenalty(Double partAPenalty) {
        this.partAPenalty = partAPenalty;
    }

    public Double getPartBPenalty() {
        return partBPenalty;
    }

    public void setPartBPenalty(Double partBPenalty) {
        this.partBPenalty = partBPenalty;
    }

    public Double getPenalty() {
        return penalty;
    }

    public void setPenalty(Double penalty) {
        this.penalty = penalty;
    }

    public String getPenaltyAdditionalClauses() {
        return penaltyAdditionalClauses;
    }

    public void setPenaltyAdditionalClauses(String penaltyAdditionalClauses) {
        this.penaltyAdditionalClauses = penaltyAdditionalClauses == null ? null : penaltyAdditionalClauses.trim();
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getStartDateString() {
        return startDateString;
    }

    public void setStartDateString(String startDateString) {
        this.startDateString = startDateString == null ? null:startDateString.trim();
    }

    public String getEndDateString() {
        return endDateString;
    }

    public void setEndDateString(String endDateString) {
        this.endDateString = endDateString ==null ? null :endDateString.trim();
    }

    public String getPartADeliveryTimeString() {
        return partADeliveryTimeString;
    }

    public void setPartADeliveryTimeString(String partADeliveryTimeString) {
        this.partADeliveryTimeString = partADeliveryTimeString == null? null:partADeliveryTimeString.trim();
    }

    public String getPartAConfirm() {
        return partAConfirm;
    }

    public void setPartAConfirm(String partAConfirm) {
        this.partAConfirm = partAConfirm == null ? null: partAConfirm.trim();
    }

    public String getPartBConfirm() {
        return partBConfirm;
    }

    public void setPartBConfirm(String partBConfirm) {
        this.partBConfirm = partBConfirm == null ? null : partBConfirm.trim();
    }


    public String getCheckBy() {
        return checkBy;
    }

    public void setCheckBy(String checkBy) {
        this.checkBy = checkBy == null ? null : checkBy.trim();
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", contractNumber='" + contractNumber + '\'' +
                ", partALoginName='" + partALoginName + '\'' +
                ", partBLoginName='" + partBLoginName + '\'' +
                ", partAName='" + partAName + '\'' +
                ", partBName='" + partBName + '\'' +
                ", partATypeOfCertificate='" + partATypeOfCertificate + '\'' +
                ", partBTypeOfCertificate='" + partBTypeOfCertificate + '\'' +
                ", partAIdNumber='" + partAIdNumber + '\'' +
                ", partBIdNumber='" + partBIdNumber + '\'' +
                ", houseOwnership='" + houseOwnership + '\'' +
                ", houseOwnershipCertificate='" + houseOwnershipCertificate + '\'' +
                ", houseSourceCertificateContent='" + houseSourceCertificateContent + '\'' +
                ", houseOwnerName='" + houseOwnerName + '\'' +
                ", mortgage='" + mortgage + '\'' +
                ", rentalPurposes='" + rentalPurposes + '\'' +
                ", people=" + people +
                ", startDate=" + startDate +
                ", startDateString='" + startDateString + '\'' +
                ", endDate=" + endDate +
                ", endDateString='" + endDateString + '\'' +
                ", duration='" + duration + '\'' +
                ", partADeliveryTime=" + partADeliveryTime +
                ", partADeliveryTimeString='" + partADeliveryTimeString + '\'' +
                ", partADeliveryCondition='" + partADeliveryCondition + '\'' +
                ", renewal=" + renewal +
                ", rentPaymentTimeMethod='" + rentPaymentTimeMethod + '\'' +
                ", monthlyRent=" + monthlyRent +
                ", monthlyRentUppercase='" + monthlyRentUppercase + '\'' +
                ", totalPrice=" + totalPrice +
                ", totalPriceUppercase='" + totalPriceUppercase + '\'' +
                ", rentPaymentMethod='" + rentPaymentMethod + '\'' +
                ", paymentDateString='" + paymentDateString + '\'' +
                ", deposit=" + deposit +
                ", depositUppercase='" + depositUppercase + '\'' +
                ", partACost='" + partACost + '\'' +
                ", partBCost='" + partBCost + '\'' +
                ", partAIntermediaryCosts=" + partAIntermediaryCosts +
                ", partAIntermediaryCostsUppercase='" + partAIntermediaryCostsUppercase + '\'' +
                ", partBIntermediaryCosts=" + partBIntermediaryCosts +
                ", partBIntermediaryCostsUppercase='" + partBIntermediaryCostsUppercase + '\'' +
                ", partAPayment='" + partAPayment + '\'' +
                ", partBPayment='" + partBPayment + '\'' +
                ", partAAdditionalClauses='" + partAAdditionalClauses + '\'' +
                ", partBAdditionalClauses='" + partBAdditionalClauses + '\'' +
                ", partAPenalty=" + partAPenalty +
                ", partBPenalty=" + partBPenalty +
                ", penalty=" + penalty +
                ", penaltyAdditionalClauses='" + penaltyAdditionalClauses + '\'' +
                ", other='" + other + '\'' +
                ", status='" + status + '\'' +
                ", partAConfirm='" + partAConfirm + '\'' +
                ", partBConfirm='" + partBConfirm + '\'' +
                ", partACostArray=" + Arrays.toString(partACostArray) +
                ", partBCostArray=" + Arrays.toString(partBCostArray) +
                '}';
    }
}