Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199FBC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxdOapeK2oSE6MJEqB86TqeHAJ0J8t/rbn9FyMtb9YY=; b=Glj3pfMGRif6B6n5kAiQUvTN+5
	oo4NTnsr5vBSQnhuJBt21jS/X1z4LTL+pgvG2X4WsG01rFpxCWCxY6Z+QmazyxfOmfYelkWXPhwfo
	l5aV9ndvjh7SpnHZro2SCX0SQwSYk4Ot8UNXWBYLuNZFOM8jwNTwwO2YVJDCoTygq0Ts/SifaHghm
	midTPOaCJKcdxORqsguzKFBkiVAylKbxXMnK3Cba3HEdfZnWI+qCMDmZufP/JNFau4Uvcohkb1hRX
	xrxcee626qRjrpICwfvWZF687uRFa4IJwBNbRq3/WUpEKfLBfl1ZP6b/6eOw2Nl09nNBNVu7Zmor4
	5UbO6dwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefz7-00000000F6Y-3IjM;
	Tue, 30 Jun 2026 21:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyZ-00000000Epl-1NEy
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDcp42948554
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxdOapeK2oSE6MJEqB86TqeHAJ0J8t/rbn9FyMtb9YY=; b=MujD+blhx5934ck4
	ZbekEeJTgiXIbzVt8MZqkQ0bmoWIaKLTUxGr61Xl6iaa7zMyOYgZI9nDfLkf3ZJU
	ssTgFI/kkZKvngyjddqc92ztOsXleYYADFgMvc0bCDI16aZ8oB12C8osEwdlD8Rl
	KEWp9WaHGwX/VII0xQV8nTmI+LHTxEdzkKZbMcqL1YzGilzTM/KKDARgJyokNQGH
	x79dsCC+ruAbbfvKkUc/Pkqnb5B+rXbLEO+QeqUrs9RBiEjINzOithccDAyb81oU
	srrnYK639qChb0NF6P0Mkj4H8t1okBl19WsMhu6kyuVzq04wSL6Fswy/QXxcfc/v
	R2/7xA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0k18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ed664e368so977697eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854798; x=1783459598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxdOapeK2oSE6MJEqB86TqeHAJ0J8t/rbn9FyMtb9YY=;
        b=We26rB5M3msZ3Yni9L4b+qEnPlM4LiOpCrVLK59ILvTvUIbCWLJ6JN8IqJTSS1YT7o
         SlPwPKlyK8WV4PMezkWusJR8/trQK7ibh0yNY9avLqvZF6Qw/nNlhTN7P+9bo6ibkrLd
         mamaNWc52kdGfUR7wrz6wLb4aL8G8KDkD82cstu1w4JR0d/Xkpwb3iTYTNmz9E8Jao+Y
         J9dnyK9SstoUtyzi286pMGdqd5PfhGHXyRivxIjmjb/hZpmDfWvB/JemB8m8d9dYZP6j
         ECtv11dDFVS5O7Jc4ODFGyxSbUw25B9VfaK9KgDcqXV2q2+rhMDt8PJgC/48EPrI520p
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854798; x=1783459598;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rxdOapeK2oSE6MJEqB86TqeHAJ0J8t/rbn9FyMtb9YY=;
        b=JvVuFGjMymdBQUZ418G7AcLZAeaqJtKumPV0ObZKWuy9kGy92DNIXeXxixmXg0g6nY
         lbkInLYhJ7/8ezLDenb65aHbqZEc0v3IIMMFzHEMNgSGRC2OTysOD6Mv5XluAqH/RPGF
         +TW706SKkbTmmpZDyyKPrzcfBmKL4O0zWEFcmFF0zMIiN3YUL9EmzWhMphgzxKi2/UTn
         xDs1sF3V2zCkEbzf7A3aAYvoKJ362YOQ+QUs9Drw0ZXj4VAvKfIRuFh76zhP+ik+uzdV
         NUs25yPIYJiXFPGqfjhcD+SBWPdj1sxLnJg2mcFvcdp8jUW5JnosBMo3S/uikpEHxOr/
         +Y+w==
X-Gm-Message-State: AOJu0YyC8ZtIN/Ktl8El+mRSGY44zArcQaT4cVLqZbHf7iEO/fXlTtXn
	lF6UNq0Lzt+Oybn2iNihBX/BHfaCMmwzRBY/hSRf5XdQdliy4KGgdBvcXKtXdntbVlVoYUqNuEa
	D28Eo23urSvWnxNqduSM9lD6Rf0WTUuO1oqIXMKa3hj9j7rya1wnubs9leo8Ww68XtUQSjIP9
X-Gm-Gg: AfdE7cmmiTcutBmsqPWrEJeGIzq1MpHtRJV1rrMQOY9q/7qUVb0T52BvMEXAE6hm5M5
	SvJd5SVMaZ1BjSfJbRE/kpUzibN/f80MY+zBIX31jsEoH5w1VXzXpqMhkIQkLT9gyZ6YOlmoy9G
	Ngkd8/6VXMwvWqwXo0y8bq8CHJtHUy2CQ7OsmXZ4rln05qYD4C03ZPEaZ0eCLH2SFjUSC5LnkIG
	2QJPW4XYU3AoAzzGIbET0I4eF5IZF7BiOmLyn+ohBD4s2uFexqPT+aS7ifHqvedRxWl6JtojXyw
	n7Zs6WsIU/HLdZ/FUQpwK6stgb4Fx6CcLCE9wq2tDM6LmxWR25wCerdCm3z00+iEHeFUe6f7UZj
	44y5OHHXdc4qzmV5rM4q6T1LzRsQU7LgBKATsNoW5Ib7i6LiNJQRBaKnqb9sPQsFuGQ==
X-Received: by 2002:a05:693c:3b04:b0:30e:d66a:3faa with SMTP id 5a478bee46e88-30eea052cdfmr2955740eec.15.1782854798207;
        Tue, 30 Jun 2026 14:26:38 -0700 (PDT)
X-Received: by 2002:a05:693c:3b04:b0:30e:d66a:3faa with SMTP id 5a478bee46e88-30eea052cdfmr2955707eec.15.1782854797631;
        Tue, 30 Jun 2026 14:26:37 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:36 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Improve dp stats
Message-Id: <178285479654.1590147.18252994064135945641.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:36 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44348e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f7Uf0HdN2HKWEhv83DoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: vgJdGBcvKoWX36-e9t24FyHqCkudHC7J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX/T4JElYt+chV
 8LCtxFkS0SSbCzDOhrXlZXK/eClF6B3CamUUnhBtLwiqxkGy8PHY9QaEy7GexfPYVukVMw/stl6
 hw00kegQ/oFORM4A/T2eLBVxbNpqwew=
X-Proofpoint-GUID: vgJdGBcvKoWX36-e9t24FyHqCkudHC7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4EdMBxIc9TIe
 yNNTp3tiE7jx0t/vr0GVs5k4CtLKfDbHI9Gu8FWMKqexvDGaULmfV0tNcBMzlY1/Ts46x1to5Tk
 3cRcP3TLvZWQEHlW77cyWH2sveHxuG4/s6OkN51jGUuSc9vm9SAIuWbgoqqsSyhFvoB+5N3dnOp
 HolmUJ0gyfapffVz4pH8d/xrpE8HQWYATfOB2EHF/nuZ3rBps/iQ5iU5g6kGtryO2DUBjmB+RuA
 NmoYChYUlk0xQ67ExTvD0t6QU3RocRdvLNofw+XvqSzNCOhUxQ+f3wvQsx853RlGxsJOKpbB04U
 /skkleiZJRsubcBNnTZ2It8fM0tECo9Dn9vkIdGVll0X8ynlkCAEaDfVHcn45X6fl6gVYGKjnii
 liP7+5j+oUA0CrKwTHC0a10XFblrEdh+WVlp67AK2bDArAFR6Jq1cW1jIj5goymIiqV4Ifo6CpH
 AFmKYSSW2B3x/L/jIMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142642_582913_D3B4193C 
X-CRM114-Status: UNSURE (   9.80  )
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


On Fri, 26 Jun 2026 14:22:50 +0530, Sreeramya Soratkal wrote:
> This short series improves the device_dp_stats debugfs interface in
> ath12k to produce more useful and accurate diagnostic output in MLO
> configurations.
> 
> Patch 1 fixes a latent correctness issue where the REO Rx and WBM
> release error tables were unconditionally printed for
> ATH12K_MAX_DEVICES columns showing zero-filled entries for device
> slots that have no hardware. Replacing the compile-time constant
> with the runtime device count keeps the output compact and correct.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Use runtime device count in dp stats display
      commit: 34620d1890cc1fcf87a95219d6781d7f7b9d8cbd
[2/3] wifi: ath12k: Add timestamp to dp stats display
      commit: 6cc84fce7b999b0c6c8aaccdfa8669f0a55e8586
[3/3] wifi: ath12k: Show per-radio center freq in dp stats
      commit: b1d8d626e206a757b745af2adcbc7127ec593a20

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


