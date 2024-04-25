Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083EC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 22:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn/H0hKXM7RhdXSnVLh3pgy7twh6PKdlOaetTj+y4rQ=; b=isoD01Po487YfZ8am3jcMrQgiI
	vn6FqzlDC0Pe479dDXbN2L8uq6Bl6gC0S1oFXNOL2oftdWKDNLXI+IltsmGygqCT+sA5OHiv37NI9
	RE5XDVC715itJj6Vrpis0hipaXmXlOumbwwFg+ocosJKxi0djpn7rQAA1eyTvzM4oHSPMbAwZhidJ
	AZND0tHCd6sz+PhNgWYQ8l6UO7lk1s7uxTlk+KwcwP41N3NnlZsdnzt4qiz+flcOYSkPbS+RjEZpb
	UmrlOEPYQz9tidHhAZRrMWLFBT5UDEnByjlxFVK8871WhP3F8i/1geEuJHxGbZ8hQn8nH+i1TQnnn
	TFSpsCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07Im-0000000AQO7-3pOD
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 22:10:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07Ik-0000000AQMV-0QNs
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 22:10:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PLaYaq002753;
	Thu, 25 Apr 2024 22:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Sn/H0hKXM7RhdXSnVLh3pgy7twh6PKdlOaetTj+y4rQ=; b=dl
	xgp8lyRf6YlP3Qi7X7Hroc7FoSqGqZUp1cE8PmA33RnePjoX1jz6fvxXkaIl7Ehn
	MX0wQpiqa8ze6RK8zOH5XarLEVJDiSFdbs8U9O3ADls/U7N2qZiohFZESt9rZjdj
	jcHPJRO9wYrH4yJdsfGBV+XRYZP8f7i2rV5AH7bpaiooAlqbATaYh12WiFuJazay
	QKMnWVbwnybC7RN2/mn4KweAc6N2/9CvV2/+V44FpKQZxNl6RG7K42AUiXbHBlMb
	Kz4QBLWHhR/TFZmIjoCsZcHkHSghAwFKg1JMIsI9SNEtEMWMu4K+DzXt6I7v0gLM
	OW6XwLJmh/JxT5u7FWfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenhku0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:10:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PMAinN016453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:10:44 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 15:10:43 -0700
Message-ID: <2b5f8ff2-7913-4170-bb56-db1976f4f9d2@quicinc.com>
Date: Thu, 25 Apr 2024 15:10:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the problem that down grade phy mode
 operation
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240425083837.5340-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425083837.5340-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WeJUdd-9XcK0W-Prc7tkNrrcxVjyo2It
X-Proofpoint-GUID: WeJUdd-9XcK0W-Prc7tkNrrcxVjyo2It
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_151046_431811_2C795D2D 
X-CRM114-Status: GOOD (  15.58  )
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

On 4/25/2024 1:38 AM, Lingbo Kong wrote:
> Currently, when using WCN7850 or QCN9274 as AP, ath12k always performs down
> grade phy mode operation regardless of whether the firmware supports EHT
> capability or not and then vdev will start in HE mode. When stations that
> support EHT capability try to connect to the AP, the AP will set phy mode
> to EHT after receiving the association request packet, and then send
> WMI_PEER_ASSOC_CMDID command to firmware, AP’s firmware will crash.
> 
> This is because when the ath12k_mac_copy_sband_iftype_data() function
> handles EHT capability, it does not copy the EHT capability into the
> iftype[band][type] array according to the interface type. So, interface
> type should not be used as an index to get eht_cap in
> ath12k_mac_check_down_grade_phy_mode() function.
> 
> To address this issue, use types_mask to select the eht_cap in
> ath12k_mac_check_down_grade_phy_mode() function.
> 
> This patch affects QCN9274 and WCN7850 because they have the same issue.
> 
> Hostapd log:
> wlo1: STA 02:03:7f:37:12:34 IEEE 802.11: Could not set STA to kernel driver
> 
> Kernel log:
> [270894.816076] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_SET_PARAM cmd
> [270894.816111] ath12k_pci 0000:03:00.0: failed to setup peer SMPS for vdev 0: -108
> [270894.816122] ath12k_pci 0000:03:00.0: Failed to associate station: 02:03:7f:37:12:34
> [270894.843389] ieee80211 phy5: Hardware restart was requested
> [270894.843517] ath12k_pci 0000:03:00.0: failed to lookup peer 02:03:7f:37:12:34 on vdev 0
> [270894.843616] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_DELETE cmd
> [270894.843650] ath12k_pci 0000:03:00.0: failed to delete peer vdev_id 0 addr 02:03:7f:37:12:34 ret -108
> [270894.843663] ath12k_pci 0000:03:00.0: Failed to delete peer: 02:03:7f:37:12:34 for VDEV: 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


