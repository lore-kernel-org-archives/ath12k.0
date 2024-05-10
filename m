Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E8CC10F1A
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZDF65rKA/SURu8YBPvrY0OUBrRMgux8b5P1ZGF+JaY=; b=WKGdK7bNrlIdmLrxJtOzX31ktK
	BmQCaBEjJoc90nvhuAcSg/b9ytsOnlbTS8urSuReq6In81JHX5iEJnyDfAO7burxrE3gqpRBDfNTL
	mRvcF3ULryzkJYKnddIxDpNX/vN1ZcHB8J9INA8zA9TY7GStSAHM1Ru1iQr1Q4bxbR3z7hzvNn139
	oeJ8grV/e7CRHKNg1lIhD8w9LifTa8DC/DLbgEvoGPLfSg/9S0ZG/gd4XRGVcMYmSjxFUEKokWYa7
	aEbIaeW7wW+TgvNI6pbD+6Gdsu6eq04VYkY9mshrkflo5+2CwNNmfZ4yH0F+ZtIjy6pl2KM6MMxbD
	uHxoh4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FnD-00000003ijd-2PJn
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 02:15:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Fn9-00000003iik-2EW0
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 02:15:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A1AumS011180;
	Fri, 10 May 2024 02:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tZDF65rKA/SURu8YBPvrY0OUBrRMgux8b5P1ZGF+JaY=; b=Eg
	0e7OUbLvsv2DtIiLpHH2owsGbwTcHqSkv54yvngagHW6UxvuV/J8H7Ifh1H6Yiwn
	IfoDsP7r8AjMq+ac2hjULftY2YKnU2OQTItAookJ+QLvA8cV50df8Tf6GIskKmkb
	u8+zFUZ/8z0vq8zpMAhgPPpNevHtnsi6wFhhC3Kigac0MaYCuhzFrcQNyb2YmQVk
	76holSeszSHcEjubwRuvVhnGbGWwLr3N4sk01onGNexzJR9Np+p1vEznY70zD7iR
	T//WWj5nyeyjzL7h5H2Z2GLJPrsy39CbdvM0xVzzV8owuEurGREZBODb4zk53NZ4
	D8t7EidByecZpwqrqMVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w20bec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:15:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A2FGs4022150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:15:16 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 19:15:15 -0700
Message-ID: <0a6d561b-635d-4af1-83b2-83303f6b5b10@quicinc.com>
Date: Thu, 9 May 2024 19:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] wifi: ath12k: Refactor core start api
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
 <20240507045702.2858954-2-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240507045702.2858954-2-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: esyjHDL1YZDCGmNSLbRW6lrPLHvm5iU-
X-Proofpoint-ORIG-GUID: esyjHDL1YZDCGmNSLbRW6lrPLHvm5iU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_01,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=755
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_191523_760526_A77BC45E 
X-CRM114-Status: GOOD (  11.03  )
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

On 5/6/2024 9:56 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Hardware device group abstraction would be introduced, in future,
> where radios across different devices can be grouped together to
> support multi-link operation and register as a device group to mac80211.
> 
> Currently, ath12k_mac_allocate() and ath12k_mac_register() APIs are part
> of ath12k_core_start() and ath12k_core_pdev_create() respectively and are
> based on per device (ath12k_base). These APIs can be decoupled and moved
> out to ath12k_core_qmi_firmware_ready() itself.
> 
> This refactor would be helpful for device group abstraction when mac80211
> allocate and register will be changed from per device (ath12k_base) to
> per device group (ath12k_hw_group).
> 
> Add changes to move allocate and register APIs from existing one and modify
> corresponding deinit sequence.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


