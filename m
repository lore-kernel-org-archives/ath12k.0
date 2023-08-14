Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A94CC04A6A
	for <ath12k@archiver.kernel.org>; Mon, 14 Aug 2023 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qe/BcCpmNBIB+3UHTRNnf2P3nBtIzrd9Jpyh45UGBfo=; b=dGFaf65ipogTBU
	QraamqHiJjkIMhgchZPs9eWxVy5Yt1wNWhaOAADHr4oA23w4tTRmua9Tm6w9P70/JwymYYqHHi3GZ
	RB1f8LQO0ZeDly6Hxya63WVtXmut3k7IBO4Bg118l3NFjCIkXUeLjPRbs0p+HBQrpBKV76hHGwCrM
	GQY0Lj+zgOeHZdY6YROkvDt14Tkjet19fUaVdDwApjmuypYZ554+lVqfdiFN/gv44G3HSx90N5U+7
	SgT82kSTpou8RWxGvZFGUM7kN9zb2QuUtqjBHBsoTHJaOIghSD9NRxpEyc+1z4NzCjkzu7IqABGjB
	NGi9VifmzyHAvxgzSDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYGB-00HEz5-3A
	for ath12k@archiver.kernel.org;
	Mon, 14 Aug 2023 14:09:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYG8-00HEwR-24
	for ath12k@lists.infradead.org;
	Mon, 14 Aug 2023 14:09:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBlj6E029566;
	Mon, 14 Aug 2023 14:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eRtRcSeLyPTUnI5TkxluVlX8y1YmXchwUnzvT+HnUh4=;
 b=K0akEjTTyi4xti+J8sqst6laRm0+MNRLo7vFD4BgBd7srYQUngWFa5iOPzUQNs7xf5ji
 qADzTy3xLqPFMHTeCSpCJv971Sn6bZ7X9s3pnHxdIpihcYPp45I6sOOnQ3gtiOS0ovo2
 PQoQJrDnVIZCxbkph26ggxReESvNZWxP8LLl4MxGnhWg9AUbp438wUqcu2Wb8jH7eudl
 ptrdJ3SMhu7s97u3ssUq+RwE1VSZEqzJYepdUrhyawa+3hjH0tNcrRmxX2Q1fEbY70aV
 YPrP5r11fdtpiDaoXtTy/Aa8j58bV5f2xU/WIcsLNrxuKl3oT8F25N1IYgFsAYnrlSMi 1w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3se3tym02r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 14:09:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EE92ol001402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 14:09:02 GMT
Received: from [10.48.240.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 07:09:01 -0700
Message-ID: <6529ca77-6ce4-d930-38a4-5ee2f9671bdd@quicinc.com>
Date: Mon, 14 Aug 2023 07:09:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: ath: remove unused-but-set parameter
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Jiri Slaby
	<jirislaby@kernel.org>,
        Nick Kossifidis <mickflemm@gmail.com>,
        "Luis
 Chamberlain" <mcgrof@kernel.org>,
        =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rg?=
 =?UTF-8?Q?ensen?= <toke@toke.dk>
CC: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Aloka Dixit <quic_alokad@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        "Ramya Gnanasekar" <quic_rgnanase@quicinc.com>,
        Karthik M
	<quic_karm@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Muna
 Sinada <quic_msinada@quicinc.com>,
        Johannes Berg <johannes.berg@intel.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>
References: <20230814073255.1065242-1-arnd@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230814073255.1065242-1-arnd@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uLjaxiIgc9QlrycbadpGy8PPMY6alyV3
X-Proofpoint-ORIG-GUID: uLjaxiIgc9QlrycbadpGy8PPMY6alyV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=820 mlxscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_070928_814757_4702549D 
X-CRM114-Status: GOOD (  13.03  )
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

On 8/14/2023 12:32 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This has never been used since the driver was merged, but it now causes
> a W=1 warning in recent clang versions
> 
> drivers/net/wireless/ath/ath9k/main.c:1566:21: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath9k/htc_drv_main.c:1258:25: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath5k/mac80211-ops.c:367:62: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> 
> Remove the bit manipulation on the otherwise unused parameter.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'm wondering if the ath12k change should be separated into its own 
patch because 1) it is the most current driver with a dedicated list, 
and 2) it actually doesn't generate a warning because changed_flags is 
used, just not in a meaningful way. But I'll let Kalle make the call on 
that when he returns from holiday.

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
