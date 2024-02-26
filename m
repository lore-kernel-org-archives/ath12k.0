Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFB5C48BF6
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y56Vqz7EzQFsk6AFROBHk0EWX4p6Ci4GcFeTw74m7g=; b=mmxKCA+beD5hj9e3A81IxDD3xA
	0EIE2SXfZm+/hfupcOud5L8V3WxqGKXTNSdYSdfsyiQ8c6jl1lQgtnWr5ngM59lodQlmzP9jIBkxa
	YSWrJlNrhoTwCuR/qWnZE3S7LBjB764pf4o9VEA2NOR68ykVFf6ltnj7lLC53TNpIB5S6MWX72ztG
	GxN1ftJa6NkZE8jbQB1+bUQpyORsH5s7BAlKCWY2zDECFoGAXqTAh8D8KXTXKEwuEXHZLnoq7WQ4E
	/liefl0owIDTI+bilA6Zp0HXCd9EnbqckdvfEPa5s2oGtiibiA6rAy+7dJcqrc8iOnm7iVUMJ1e1P
	ktyCKeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refy5-00000002DyF-3Lnh
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 18:44:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refy2-00000002DxM-2IBM
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 18:44:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QFgxuW026239;
	Mon, 26 Feb 2024 18:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8y56Vqz7EzQFsk6AFROBHk0EWX4p6Ci4GcFeTw74m7g=; b=cZ
	0Buhji/+tgGawZPPK7ByiysF+6uj9nJgBqYwoLVLwaOo+rMRmHm0fZTKL8yJrjLc
	i3KfWVK7TeIUVFbbL7Yojnd7knUElLs1FhT34ktQFs2WV9U/9+S8+g4r8pEphNGH
	LDtCkLfOT4K2PVbsX3Lmift3BF2l3TqlpOYqA523Q/okA+PscyIpiy+fndZWOGwG
	bY/2RTxIVac1UWuZrW3G5GYMJR/7qtdBBHlG2x6I/3y70k7mpom8l/c8lfPvzsi9
	02yIg6hxr3G4cHgS8UYaccLsdUuqBtsUI06zW00rBhBPdFIvW4iOMdly/wuUUmZq
	njebSSsFwz9WaGxrnBOg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxm1sv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:44:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QIiiDd011665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:44:44 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 10:44:43 -0800
Message-ID: <dd70cb66-48fd-4574-997f-60825b46a7ff@quicinc.com>
Date: Mon, 26 Feb 2024 10:44:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Optimize the lock contention of used
 list in Rx data path
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
 <20240226162310.629162-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226162310.629162-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2EX0QoOS-f9ux9be-gZV4tm_hLGVKwfJ
X-Proofpoint-GUID: 2EX0QoOS-f9ux9be-gZV4tm_hLGVKwfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=455 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104446_770335_FC8569C7 
X-CRM114-Status: GOOD (  11.68  )
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

On 2/26/2024 8:23 AM, Karthikeyan Periyasamy wrote:
> When a packet arrives in Rx rings, the RX descriptor moves from the used
> list to the free list. Then, the rxdma ring gets replenished, where the Rx
> descriptor again moves from the free list to the used list. At the end, the
> descriptor came to the used list with unnecessary list movement. The
> descriptor used list is maintained in the Rxdma ring structure, which
> creates lock contention for the list operations (add, delete) in the Rx
> data path. Optimize the Rx data path by removing the used list from the
> common Rxdma ring and maintain as a local variable in the Rx ring handler
> itself, which avoid lock contention. Now, to find the used list descriptor
> during descriptor cleanup, we need to check the in_use flag for each Rx
> descriptor.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


