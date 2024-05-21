Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F9C25B77
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 01:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2rR7iP4BLpQ5k6qU7WAbm9w/wIorJVlmfD0EJBZ+w0=; b=J75kBObt7li+bkesPI8TzFM33u
	rkf+M7TdCRR7pVtfPBMQZjF9/5eAq+u3MHeoczebHmbmjWcNzOXq20x+2aCuP1VBav4cuokkzG10o
	dAdwv92DvJ/kiSnaZTzVrqY5fPkVOabse/0zGxD44roQn8kMGV4uJ/fh1I//kbNReok8TxpcQL/YX
	vnOIef/2wVwLbxsAKQN2+kqd0I0ZNWt9vpKPitvQ8e7wiP4oEOsShFjqUfIRvVq9Jbm6qAShTraGk
	JsOnptbeBQ5ADGVMnAm31YWEv5p3RB2KEa9stZVJcohFsXJNpo6yhHFzHnbTEa2FcEX1rOKPZI80S
	938fbvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Efn-0000000G1Kd-3EAg
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 01:52:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Efl-0000000G1KA-0Dw8
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 01:52:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L0Nljt008286;
	Tue, 21 May 2024 01:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Z2rR7iP4BLpQ5k6qU7WAbm9w/wIorJVlmfD0EJBZ+w0=; b=Nn
	3ODDE5wvInjQNWcknWSrvudqXQMJ+2KVHB6qdtso0xsPuhFm/IiiczzRGI6oP/yv
	Qh5pmbod6cAtj0Zznc0CIvuyD1CsOkHe0CDT+/sTTGQCqBmSCpNgYc6PouQtBs0h
	HwNmVCpnaR2Wm8m4Dzuu+oIjmfXTPJM0f3IP5ZMvIHT7lufmwPquX//vbrMNgT9J
	5ksQL4jKOGWH9Wv+5pm5T/4VyQ7WsXRQK2KGw+ROkiBoslhqJaN/JA+7elrMk6Es
	mJvMUXAO7OZUaH++J71c9/7AtGWeUAlKuNdqAHrdEehtH43fzZpOZ6rcXO+0Wm3p
	7mNfyjPR+5cEVYyErZoQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqamhxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44L1qBDV011112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:52:11 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 18:52:10 -0700
Message-ID: <878c0f4e-130d-4852-b5ee-8ef59ed28331@quicinc.com>
Date: Mon, 20 May 2024 18:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Send QMI host capability after device group
 is ready
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240520131409.676931-1-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520131409.676931-1-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M7SIUxCiPRB15Z60ww3GKxf17FOzzwrZ
X-Proofpoint-ORIG-GUID: M7SIUxCiPRB15Z60ww3GKxf17FOzzwrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=926 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_185213_141758_49292528 
X-CRM114-Status: GOOD (  14.88  )
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

On 5/20/2024 6:14 AM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> QMI host capability has the information regarding MLO parameters such as
> device_id, MLO capability, group id and the information of each devices
> involved in the group and sent immediately on QMI server arrive event.
> Currently, only one device is involved in the group and hence, single
> device information is sent as part of MLO capability of host.
> 
> But, in future when multi device group abstraction is introduced, host
> should send all the device information involved in the group as part
> of QMI MLO host capability rather than single device. Hence, sending
> QMI host capability immediately on server arrive of a device might not
> be ideal for multi device group abstraction as the details of other
> devices in the group would not be available.
> 
> Hence, once QMI server arrive event is received, request for QMI phy
> capabilities of device, and defer the host capability send for that device.
> After QMI phy capability is received for all the devices in the group
> trigger the host capability event for the deferred devices in the group.
> 
> Add changes to defer the QMI host capability event until the device
> group is ready and then resume the QMI exchange for all the device with
> host capabilities.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


