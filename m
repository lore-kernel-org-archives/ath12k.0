Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E7C48292
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GazEYcOfj78Iv0+lnmZ8xLRg78Ggjpx3nxYAAFeqvU=; b=Ow7ZcevokornbQsSr7rHxS+W2t
	CpGc/BRJISB7jPbWTrQgYmPWCz3Ay6Ipd33V9UnrCxLrLFYf+F6/9LxnA/IY/F4BS4Xiu3yigJRWe
	hyjD3s4IrCVELx6pJyrUukZnWY6MWm89Dka6yOzcbbNWrQNCi3KhAJEjZLalX5T0RauqdeJk5u8jP
	bNkujNQ0JbGKJmCiYaUQup4SiYMFjcLS5Wf31bNHUklPVEe5pzW3XdEJeaJkjYV2oLJgo/8J49psW
	GJiPX7k+1ttarDyXj5ZZfU0HtLq+kvo6dYDy8rIrjHAzxerGSMuDWroPdSh5SmyiOfaDEbFtMYfwm
	Hrb0gtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5vh-0000000571K-1qbK
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 20:51:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5ve-00000005704-2lI0
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 20:51:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415Kgjrg013057;
	Mon, 5 Feb 2024 20:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+GazEYcOfj78Iv0+lnmZ8xLRg78Ggjpx3nxYAAFeqvU=; b=Ls
	tfVTsFCedBpR3yoAmG6F45iw8P02Rf3jbtEpYPKArRpYFnMDkqi+RKrAe6RFhdOF
	13G32h4rzsNdOOhL0KveFLGJzpTI+NO5HixU3gaOxUfjR689uCXVSFRn2BawTwfc
	CImh0kGSRnvGxr7fciTCLP2y2Gmadc1VGqjJwpGe+HE5P1r/Smh0Js/etSMrKVpM
	e1dQKhl4vMLil/c/TtFndT3Lid4h1u74SCDRHRt99Eq8+lOhBUzlyQ8ASjdO9t6R
	vVn9M0Yf0F637S/wMG4tXrhDjzYQf6GeUN7MhOsVZ0lyhNQRZ5QaO3mxJEYqWsRg
	C6XeAWiQMkHslaYyPVvw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2v729pba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 20:50:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 415KooVE008944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 20:50:50 GMT
Received: from [10.110.62.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 12:50:49 -0800
Message-ID: <b3c7578e-d8d1-4f3f-9cd7-eb3fda57aae4@quicinc.com>
Date: Mon, 5 Feb 2024 12:50:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized use of ret in
 ath12k_mac_allocate()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, <kvalo@kernel.org>
CC: <morbo@google.com>, <justinstitt@google.com>, <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <llvm@lists.linux.dev>, <patches@lists.linux.dev>
References: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1eWMtrjngK4Z-rmsMQgfwWnFjBCRDPj3
X-Proofpoint-ORIG-GUID: 1eWMtrjngK4Z-rmsMQgfwWnFjBCRDPj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=727
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_125058_861094_47B2C568 
X-CRM114-Status: GOOD (  10.16  )
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

On 2/5/2024 11:49 AM, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/net/wireless/ath/ath12k/mac.c:8060:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>    8060 |         return ret;
>         |                ^~~
>   drivers/net/wireless/ath/ath12k/mac.c:8022:9: note: initialize the variable 'ret' to silence this warning
>    8022 |         int ret, i, j;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> Commit 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211
> hw") added a completely uninitialized use of ret. Prior to that change,
> -ENOMEM was returned to the callers of ath12k_mac_allocate() whenever
> ath12k_mac_hw_allocate() failed. Assign that value to ret to make sure
> it is always initialized when used and clear up the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1989i
> Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


