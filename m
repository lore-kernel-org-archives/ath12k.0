Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A560C02194
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tW9PiE6Uggch1rl+VNHUMkhQgUT6+CObpqMjcgW0j4=; b=zQBlQbPFf8w9Cwn5nB4v4nVEky
	WWTCr1Dx14Dqkea1U1TtjaCbNLHYDKGbnVuHb+3nBGq749ZmKFNzQ2Nh4BDs5CPT3FfnHBa0ySJFX
	KOUlc5mfU7gsfP44O3XgO0XrZpeAXVSo6gxSyerlFTbIw6meldelILnCM/X6Pum2QpFIUgTrlU4xF
	nZxUAiUx0e2t2elMkR2j6HiUPI6WGgwdBmFc7sveaBae8klSyvIGGY1EopioosB684dwDTb5SDy56
	YHvy+qedBwAZpzXtI97lNHTLttCAlkAucBC5fC2iZWE03EVjErVrlgmGioMnALdJWD7/dWfXFPa5c
	nBQQYuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg6s-00000003V2Y-48kX
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 14:10:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg6q-00000003V1v-40mQ
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 14:10:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51566cqu027844
	for <ath12k@lists.infradead.org>; Wed, 5 Feb 2025 14:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tW9PiE6Uggch1rl+VNHUMkhQgUT6+CObpqMjcgW0j4=; b=VGx+aWXflJxuhxt9
	mhcF/vukRqGSIyrfbiBic7DmaEEbsPLQ3HHGadOMXUGfchRcIbqxdFH+Y24B6RBQ
	TPy3Hps5N+XTfTygE+mOL8oe6lSMkixVANeooWVeUz6pjx6mpBOPM6ySPLbBKhtC
	hplNbcVV5LsdeDS9d139wZAMBFdlPuJ3omGBwqb1EGqP9uPYGSVxFpXKAsFIMO9X
	jCtHraSDgP+FvQVxHozx77/ek/swkEPs413Q4GXAH6RETpWzfe+1ZHjMF0+YAk9U
	lPJquQvusw7mMus3ZpEvu9yTGcEFmdd+YaOP/Qsz+r4eWfsdWdq+mpRN55C2iPm7
	0n2GWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m2ea13ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 14:10:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f816a85facso13110034a91.3
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 06:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764631; x=1739369431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tW9PiE6Uggch1rl+VNHUMkhQgUT6+CObpqMjcgW0j4=;
        b=Un3fEWDpoGCPdJax4eB0UansrJoldiaUlGgu+yVJRhCxfh/Vy177fHXD59LKmLUXSM
         7m4Ksa6gnNorv4EuuEU1A3wFWhy2awJ/CRudrmmptr/7XzmuEkBbSZBhfFEYfrYh1wxd
         0iMoK4Lzi5FlRR5KCCx+rEsUiF/bjTE0L7P3xwl4NFAB3cBE5DAcrm5hadlLL1uiZ91E
         /PDhfAgz7IrBOu0ZgX8hJjtiSJQGPuQrfC5BVACBYQLU00lIiSjlxECb8nUNmILZhIox
         SouH7YrP8iw1nLlpQ0G8Qc8DoaX6L2Plba9NU1rQ7kW/a0tvIP/7o+1wwZQekg7J1zXV
         d5+g==
X-Forwarded-Encrypted: i=1; AJvYcCVuUKMROX48aiU4+oEekfPHLd+IygQYL6NfnCSeKX8XXUDu7sU/hYR7OIMNm2CRH0oL79ukmR8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLxOOrP1EB2ub3HbFEpgdVQeAbRI46P8y+6Yx8Az/GLON6XrXO
	gFqkiQvZOyHvdgUWw9ZPSj0X4gfme1WfseONUKkLaB/BIxpshHoHz2bnBXYtgNophgFmJ4+ZfGZ
	13sIF1cLuaS1/R3/g9GPj+7T+qb40FCq3LYfLrvRsidtK9Q9mbuRmany/KZL5
X-Gm-Gg: ASbGncvgsUXXqWsTY/dR4Oi2H8qupHXEpkAPHNNP7fe2iLwbfBge2CoGN8IwDMIeg/q
	0Kvg9Ow/PSSCH1nP2OPplCD3i8x1kCnj0ckpUPb8DtqYXRDpANqt/fjbw7JbKJox7l/XfBcgrb5
	78JmXnvypxXCVlo4Kt5s8BBygGrx12jsRvGraee7RzJAHOkrgAOPcxo/FV89M7NpiQZXac9/Xac
	qfSBn+HZWOi7kkBc3A08cCTJ+BV/zqd8uAAbTA7L2x3ysvC9n+fLrHs1mZrO4OHQ9fo0vaEj/B7
	NxjJR/+mB7sIJyxgyYHObJmciyvpm5FwsTtGXLXpn9aez7ztq4hF
X-Received: by 2002:a05:6a00:a81:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-730350df59emr4741157b3a.5.1738764630561;
        Wed, 05 Feb 2025 06:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4rFAQZq/54xv51y/JyFYfTwbzoD93BbJyApBVaYuSBCDIVueZ7AgbOnP2zjeFkL8iuAQrDQ==
X-Received: by 2002:a05:6a00:a81:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-730350df59emr4741070b3a.5.1738764630142;
        Wed, 05 Feb 2025 06:10:30 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a94csm12984892b3a.173.2025.02.05.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:10:29 -0800 (PST)
Message-ID: <395ab26e-f7ca-82f4-9bdd-ad69871fccbf@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 19:40:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 8/8] wifi: ath12k: handle link removal in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gO2fcVh6Vv2l5l9wTNXtUjM0t4YJYWIE
X-Proofpoint-GUID: gO2fcVh6Vv2l5l9wTNXtUjM0t4YJYWIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=704 impostorscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_061033_113140_8EF63DBA 
X-CRM114-Status: UNSURE (   8.32  )
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



On 2/4/2025 10:35 PM, Aditya Kumar Singh wrote:
> Currently, the link interface is deleted during channel unassignment, which
> does not align with mac80211 link handling. Therefore, add changes to only
> perform vdev stop during channel unassignment. The actual vdev deletion
> will occur in change_vif_links().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

