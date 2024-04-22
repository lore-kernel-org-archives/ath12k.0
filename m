Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E82C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkSYpnfgXd74FfwLXA9VkOCH5tkB//12GChwCN3/pNE=; b=2ahGvAVsOCMBy0OdsQCW2AElpK
	hH1ooxlfU7L8CnJwq66r0raxKgdqsGB07fjtB5cD4uW/0IJH5z8HIPCYm/LBk9Ha0gpizmmNowSGC
	jKYj3J5rsfEIA8hNh42BfR/dINQSxeRHsUjh2Mxsx2HY4kLkue1mJbJsqZv5d0RmQfQRYSp09IMeW
	4j5VY+WSQvjzo6PSkw2bp2oLDiAT+3xyg0s1J5gz2Or2WNWrNek+1nR6OY8Uaw+GhJGKbqfsXOaGQ
	ZE+cTichj+xDSog2HFpAAVE8QtZcWHE9dRwiZMMvLCTyBdqxvpwzVP6JZV2cUhRqCJgeG0/C3+Dw8
	x6OwdIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpa-0000000EWJQ-1o0P
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:51:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpX-0000000EWHX-1Tza
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:51:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MDfMEB024401;
	Mon, 22 Apr 2024 17:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PkSYpnfgXd74FfwLXA9VkOCH5tkB//12GChwCN3/pNE=; b=RQ
	0INPJbOgDiUc4qzGCWBUMNPWWKCEj1mgJnCTlof9kBUStrMBknSDzN5vS0R/511v
	k4nR5fQ/JXt/ttUvazcnP3NaX5QCIOn8FyDI27pRKnlm2N43FbD0m3sBGNLaljr1
	XjWVBKGlUKCWyIUZAh1dvurEmeP5mca8ieEuasD623K0UH5E8Ptzeram84Em2h0G
	qN6HCK7F+DIBVWSFy8U8oLdVwN2QLSeRw4c11ZoNUNh1yMbMIz+DMs3nKOukyGSK
	vrDi6Zi5PW4uJ9FQ4P6pChX8dIxBfWvTeJNFF8AAJsUVzVMtzY4e33PRDlgfC1Wr
	mQfXvziU0vVEBemU9V1g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm5sx56u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHpnPA011900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:49 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:51:49 -0700
Message-ID: <6e4940c8-4962-428d-ba46-a341ce208502@quicinc.com>
Date: Mon, 22 Apr 2024 10:51:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] wifi: ath12k: do not dump SRNG statistics during
 resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sfdy5egdbuKB3SFCODME87bscgA6xJwt
X-Proofpoint-GUID: sfdy5egdbuKB3SFCODME87bscgA6xJwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=678 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105151_549496_A5AF06CD 
X-CRM114-Status: GOOD (  13.41  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> Both the firmware reset feature and the power management
> suspend/resume feature share common power-down and power-up
> functionality. One aspect of the power-up functionality is
> the handling of the ATH12K_QMI_EVENT_FW_INIT_DONE event.
> When this event is received, a call is made to
> ath12k_hal_dump_srng_stats(), with the purpose to collect
> information that may be useful in debugging the cause of a
> firmware reset.
> 
> Unfortunately, since this functionality is shared between
> both the firmware reset path and the power management
> resume path, the kernel log is flooded with messages during
> resume. Since these messages are not useful during resume,
> and in fact can be confusing and can increase the time it
> takes to resume, update the logic to only call
> ath12k_hal_dump_srng_stats() during firmware reset.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


