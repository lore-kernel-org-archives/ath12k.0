Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6788CDB483
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBgZlSU2Nik3PVMztrWMICsGk0lwL5tXaS3sf2dgL2E=; b=WO8/QIuVO/L0Ht5T9+4Okg5+5K
	7VqQhXd5FdP26GrgiNf68H95YORD34V6XGvoNCFwOFABlxyN8Y3fv4KpHM2wmwwhq/F1GQpYWyM8d
	8tr1xABhFNgOlmVI8DSJd0gyB6vMs56sJeDksCZ8kXT4zbe8O1kzV7V5Rp6jekaE0hogZ0gtzUaj5
	QqDWOdtNjCg3Gk36JVkiKP5KeYg6aaP71kZkTvb62pfbbp37xrNhcZKuwL2hvDqyM3OzrcHaykgsB
	wSHzVCDaa7YOF9KNOo4VBbmPDVgbn0NKLv6D7g/15eYT2CwyTiC6qW1ihGp8iStQtd7Zv0O1UafEf
	PwaTK+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNCM-00459Z-1j
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 18:47:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNCK-00458t-0Q
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 18:47:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DCwcdM021666
	for <ath12k@lists.infradead.org>; Fri, 13 Oct 2023 18:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mgyIlKiCupEkryq2PhtTzjo6bPLceoo+DWOAWs90oTk=;
 b=Orl8EwrS/cVvqplLcJXAXV1at3NdcYYaU1JIr0ScrlTPkaBmWcXHdELwQL4UIFfgc1zg
 EQzK1bsN7JDaSoh0Tge/eToWBqyd+NHR06UvEsNugVi8Orrep0xEFTWVfKHOBr1WY6fB
 R+ar3d8PxLKi6hZm/iRcJzAFxvLCXgWAJ4NXVDW/V/89Nuk66LIu7folInFMu7bsacVc
 20IGljEjYGhyZKjBXcMujMGNccQ4Lnb3y2YO7hZv/jkViQM5kVzExAu18ismmzg6liCs
 /G8kC3MCcoPLpSrJbj5T/O4l4py5juZa483lvf1XD3kKwrh1YcN82vUNummEG1lViArj zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt10ak5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Oct 2023 18:47:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39DIlgek028080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Oct 2023 18:47:42 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 13 Oct
 2023 11:47:42 -0700
Message-ID: <20f86b95-ce4a-4938-bd94-869e632231d8@quicinc.com>
Date: Fri, 13 Oct 2023 11:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] wifi: ath12k: add set band edge channel power for
 WCN7850
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <20231013114434.81648-1-quic_lingbok@quicinc.com>
 <20231013114434.81648-5-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231013114434.81648-5-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IDJQ90i9pToFpMCT0DJKKIw6twFDdRV9
X-Proofpoint-ORIG-GUID: IDJQ90i9pToFpMCT0DJKKIw6twFDdRV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=658 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_114744_170840_D56C64E9 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/13/2023 4:44 AM, Lingbo Kong wrote:
> Currently, ath12k does not have the ability to set band edge channel power
> for WCN7850. In order to support this, ath12k gets band edge channel power
> table in ath12k_acpi_dsm_get_data() function and sets pdev_id and
> param_type_id, then finally sends these data and
> WMI_PDEV_SET_BIOS_INTERFACE_CMDID to firmware to set band edge channel
> power.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Verified ath12k-check

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
