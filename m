Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8104C47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbAgYYET6iX1BnZJ6R4plh0iH3w4RPEhpQn8GIAW7GM=; b=CAIhSgJW3oFEw6XSne8+1vPh9a
	bdPYuNTBPM2OX6YkTe+j8fU7b+JLrCGgVPhprXviE7i84cXEvmcetmbpcqKQyRCYNCIOf63X2l/hL
	s3IBYxa7E2EYJB+VVybBO04E7QFMtiLgRyXiRHW8TKWjhT4XRXp2kjreiA8oaalBfdvNuybEsDaJP
	6VctHwBpSuFXz9iR/kh5PjZF+jKl3gMFOsNk0MLQ4/upn6r3bTg35xkYIG/+6in/5Ja+v3DGkBzY3
	qMKqFHTqgTwo6tUcSrrnX6AMBEJMw7wzO0+s0qi9d1u7yuzcjHorpd8ozGZba59/MzI6IWcc5WS3S
	lqCfFmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHpU-00000005RV4-2P8v
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:09:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHpS-00000005RUi-2Zoo
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:09:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VG3Qm5001438;
	Wed, 31 Jan 2024 21:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tbAgYYET6iX1BnZJ6R4plh0iH3w4RPEhpQn8GIAW7GM=; b=Xw
	EMIujRrdLPMuy2aEqoZj9OnWcV1ZJV7XpdHzwCdp5RZaEbeGUm5Ly7rG19BzHLa4
	/W5Fa6mZMtan8CwBhZ10xn44znJwMHRBLK1xsEmj/i+FELw0ALoakm5whi1ioPz3
	n6o+jcwU3tk9/EM6EAxTiAbgMNWtkxfelmAoih3/X5lcseuHmLeb354PI7S96aXR
	CblMdh+HM9V8RvGLal7wiphMytJd0B/3ezYjNIU3uAQ/T+Ux+moNdMPK7/PwoKEE
	TCKePKhDUDWFtNh7tLQLQi+/Qrsmpy/6++1HsP7KuNFaUUTCx3bfUvVI3KLf576+
	b7HXE026GAxKf3vlV/8w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vym2m9ju6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:09:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL95O6025828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:09:05 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:09:05 -0800
Message-ID: <f58ba655-66f7-4622-bb79-bddabf76f355@quicinc.com>
Date: Wed, 31 Jan 2024 13:09:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] wifi: ath12k: Read board id to support split-PHY
 QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ganesh Babu Jothiram
	<quic_gjothira@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IaTxkdVFHPv2ccJyGorfr25h08qMoHIy
X-Proofpoint-ORIG-GUID: IaTxkdVFHPv2ccJyGorfr25h08qMoHIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=741
 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130906_692020_A76016FE 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> From: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
> 
> QCN9274 can support single-PHY or split-PHY architecture. Currently,
> only the single-PHY architecture is supported in ath12k.
> 
> The split-PHY QCN9274 requires different AMSS firmware binary
> "amss_dualmac.bin".
> 
> Hence, add support to read board id from OTP. Based on board id
> decide whether single-mac / dual-mac firmware needs to be downloaded
> to the target. Also, update HW param max_radios to support split-PHY
> in QCN9274.
> 
> Also, add new Firmware IE for firmware_N.bin
> "ATH11K_FW_IE_AMSS_DUALMAC_IMAGE" to support dualmac QCN9274.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


