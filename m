Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E448AC2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 23:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QNSvlUkFnua3wR7wSATZ0ytr3hC3zgYVs3BeRoZkaU=; b=j+OjwlhBa+aP79lHI1QM8e1Ynz
	Mu+4SSHom+kw9Dfv2luFerKwHE5r53nKY/tNISLjRdv5g9gzlljSgWan3HObxZxxtUWwLBD7siVQO
	1N6bkQNvW6EimIcFPgb+WbWl/GUV5+XOQAAuRm+cp5/8HFEASutk7TqasWxOX9OAhN6eL7NEWblru
	vY8QxgNn7bBszNsOihoJbceGpT62CdvSwzv1n1GcGQBCGmIhZK0aBbHJTEJpuOMwHiOvhK7r31cue
	NE1nyDVLkNbq2gn6UsPWPpu+ut7F9zRxV54TE+7YDc3+sIFq2jJOdx3kycWQBHIt9J1RD/+grWra1
	biXxU1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQeX-000000056Fi-2kPg
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 23:41:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQeT-000000056FE-3rE2
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 23:41:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461JBDJR027778;
	Mon, 1 Jul 2024 23:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QNSvlUkFnua3wR7wSATZ0ytr3hC3zgYVs3BeRoZkaU=; b=lmeV0J0WID99SRZf
	okU6maolMIaAwVx3Qlp+FXCwrdl7S0QyrGVadoe6H9M/XKu/9woZ6oMV8DVmmw7D
	4WotBcCK+dDXkiDLvlS2Rgcl2BddLQeBbFj8/9PxOTVpRZtIDqOCIJz9WmFsffgZ
	/G4EtuVRtLeXcZ4hNdCTHS+3Bb4A0KQ2f4gj8kbVCVlGq7g1jHq2aCGFJnp8lzuL
	cPF4mgjBnZusWK8C0qLD73Uz5NfNweCeGhegNm4U+ILmqEVJn6RcjNvw1Evo/u7P
	6pzdMi8E2FKyWBfFEqM0hixDJW04eOMXdUvYEOF6/4OWyVNc+BSMyJru9qsPH0mu
	feKhLw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnnwr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 23:41:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461NfciL020582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 23:41:38 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 16:41:37 -0700
Message-ID: <86fe0a4c-d8fd-440f-8c6f-55e4cf4755a0@quicinc.com>
Date: Mon, 1 Jul 2024 16:41:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] wifi: ath12k: Refactor core start api
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
 <20240628095139.292952-2-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240628095139.292952-2-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3g-XbqOAkQKq8AT2SM7ZofmkLsNXV8pE
X-Proofpoint-GUID: 3g-XbqOAkQKq8AT2SM7ZofmkLsNXV8pE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=768 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_164142_407203_7496B163 
X-CRM114-Status: GOOD (  11.28  )
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

On 6/28/2024 2:51 AM, Harshitha Prem wrote:
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
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



