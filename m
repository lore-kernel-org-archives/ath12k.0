Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C99C4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWaZSiWUv4nn8pi7lN1cSjmAy/P+iMi7P54lpPfTmqY=; b=36rTuxW7GiIiz2yafDEayE+tH4
	W1pkv4Xw2iS098vVSzixJqX0hG5CoPYfDQRV4Kle3MX5gehbERzmwFFtpiIplnB4XgEL0vi7ghOEj
	yv9cQTlsh2ETP2iYr/16iealdU1O/KkhXJV7fnMe/OZOTGZqnwRTvg5VHG4skbzj2MIDb2m/R7Ohr
	5IkTPuN179g2utZyIvkYcb5korX6+AiJLnn+pfjh88aBLo9iGD4GsKQ5igY5i0J0xzLveHiOjkSyc
	kza4NVa8iKGQRWrIHICBP2Ib5GCapxkYnkPx7dP9dsVxzNZVN8CN0AhGLFv0Xzazn6qf99qW8sY3I
	mA0UUPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQwz-00000009Qe0-3RNM
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 18:21:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQww-00000009Qd6-0BJp
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 18:21:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FHepbx013786;
	Mon, 15 Apr 2024 18:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eWaZSiWUv4nn8pi7lN1cSjmAy/P+iMi7P54lpPfTmqY=; b=M/
	I/6t+IfdmydB6fE/LMdP4INT1UI5OQ+LPqMOPqSQ9Qw/HpuGgX9QThSPmwjieqtu
	EMNj8bBJ7vnzDLGqBs6MhtqR1vlpQc6BFvYLrDEo1UKU6WKPmeVG7G7ZyFBO2wDp
	2pXP1yIfgeZ5dFwU7wDFdFAEtN6qYy5X3qfZwoHfHGCGESS4qKypKCMgStLLnT4m
	NsbdfhtJg21VQGuIdeiYlbs1f5bmm/zPbUNIN8Cu012tZWdTNeo8Tit3TrsZv9S6
	J2JDJOb+ylDH3/bEhy2j+aYvUK8PKEkvSK8/YRuHBTkSZW7p8bVOlG7EnoJ4fK8Y
	KmAKzBrezrRRMrrIsSYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xgw01sxqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 18:20:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43FIKwsu004248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 18:20:58 GMT
Received: from [10.110.3.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Apr
 2024 11:20:58 -0700
Message-ID: <a01e2408-6016-44ff-aadb-13471a43c6c5@quicinc.com>
Date: Mon, 15 Apr 2024 11:20:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: fix out-of-bound access of qmi_invoke_handler()
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240415171323.2484291-1-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240415171323.2484291-1-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9KUUx2EkVLdugGAH7f9qTXCd0vnOHjIH
X-Proofpoint-GUID: 9KUUx2EkVLdugGAH7f9qTXCd0vnOHjIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_15,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=812 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404150121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_112102_439455_5778D620 
X-CRM114-Status: UNSURE (   9.66  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 4/15/2024 10:13 AM, Karthikeyan Kathirvel wrote:
> Currently, there is no terminator entry for ath12k_qmi_msg_handlers hence
> facing below KASAN warning,
> 
>  ==================================================================
>  BUG: KASAN: global-out-of-bounds in qmi_invoke_handler+0xa4/0x148
>  Read of size 8 at addr ffffffd00a6428d8 by task kworker/u8:2/1273
> 
>  CPU: 0 PID: 1273 Comm: kworker/u8:2 Not tainted 5.4.213 #0
>  Workqueue: qmi_msg_handler qmi_data_ready_work
>  Call trace:
>   dump_backtrace+0x0/0x20c
>   show_stack+0x14/0x1c
>   dump_stack+0xe0/0x138
>   print_address_description.isra.5+0x30/0x330
>   __kasan_report+0x16c/0x1bc
>   kasan_report+0xc/0x14
>   __asan_load8+0xa8/0xb0
>   qmi_invoke_handler+0xa4/0x148
>   qmi_handle_message+0x18c/0x1bc
>   qmi_data_ready_work+0x4ec/0x528
>   process_one_work+0x2c0/0x440
>   worker_thread+0x324/0x4b8
>   kthread+0x210/0x228
>   ret_from_fork+0x10/0x18
> 
>  The address belongs to the variable:
>   ath12k_mac_mon_status_filter_default+0x4bd8/0xfffffffffffe2300 [ath12k]
>  [...]
>  ==================================================================
> 
> Add a dummy terminator entry at the end to assist the qmi_invoke_handler()
> in traversing up to the terminator entry without accessing an
> out-of-boundary index.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


