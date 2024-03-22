Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196CC54E71
	for <ath12k@archiver.kernel.org>; Fri, 22 Mar 2024 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCTRfJLugi1U1gmWmTaMXjYjIO0ASWya5UlcfsnlHew=; b=MCV8i7jERoP0KDEsjeD7HPPND1
	0YNv0JIEaC/JYmaFGs/mbMRCDf1E6Xji6wdZ50R0hhiT2qjqq/+5DsjCREIaSS9ckhPlq/bVXEo8f
	/LQS7ddbN/8kiE2PxeAEfm2/I12yveKtNtVNvuEXjCGtTK9PgqMXjbeXLTArd/wF0rufBPrU9DM+D
	jza4cHEuGIKHd5IANjIUErxRhIzgObDMxLGctwDUtfnw2Mya398BchgJcOmyLhYkyyojmKMhwFO8h
	gXmNSBACR30OCXRvvzvon1PiliBOX8R9jZevy6fnWDrsWEj33s402quE2k669TyKk8CXtK8pDriud
	hj7keIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh4y-00000007neE-40Tr
	for ath12k@archiver.kernel.org;
	Fri, 22 Mar 2024 15:45:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh4v-00000007ndq-3RP5
	for ath12k@lists.infradead.org;
	Fri, 22 Mar 2024 15:45:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42MBPOMf021459;
	Fri, 22 Mar 2024 15:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fCTRfJLugi1U1gmWmTaMXjYjIO0ASWya5UlcfsnlHew=; b=ol
	4+qsG3fA+9iCxVkKotWF1I7YiFcspp8sHTDXNHf5wKYCEVsU6a/LohYTXxKCs89j
	aW5zIt0PxBOG/Ygqb4ReP3PpMfTFLNE1bKL51fDP1JF1aVZdpYMZX/2oZk3ZhujM
	2LQNmWxwjh3IKSqbrna+/ygQmq5x7NNZRRrK5cINEiT4OP908f7UZT/6zWEPfgAX
	/Z5RYIfSBsU7F11mXV0ehyi/eRhGQxMnFP2YZYUf/BVtsaj1ePdYuK/NnVtuuuzp
	X14aHQzPgCDKs2ejtbqO4wwPMfN7AWQsY+ao+V7WDLQyuJwwuSFn9RfjNaYA6tyk
	heJJ/lj4JAZpqSaDFjvg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy92h25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 15:45:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MFicBF029779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 15:44:38 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 22 Mar
 2024 08:44:37 -0700
Message-ID: <c4332e24-6e17-4a14-999e-71340873f67a@quicinc.com>
Date: Fri, 22 Mar 2024 08:44:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2]wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 462cuQYZwofMS-FxibgT9vze_RHVi8vs
X-Proofpoint-ORIG-GUID: 462cuQYZwofMS-FxibgT9vze_RHVi8vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=813 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_084510_082995_A95B6605 
X-CRM114-Status: GOOD (  10.15  )
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

On 3/21/2024 10:42 PM, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> ---
> v2:
>   - Fixed errors shown by ath12k-check

But introduced a new one:

drivers/net/wireless/ath/ath12k/coredump.c:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath12k/coredump.c', please use '//' instead
drivers/net/wireless/ath/ath12k/coredump.c:1: Missing or malformed SPDX-License-Identifier tag in line 1

Note that .h use /* */ and .c use // for SPDX comments

Also note that although this applies cleanly to ath-next, it does not apply cleanly to the pending branch, so it will eventually need to be rebased.


