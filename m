Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D6C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8+dJdN9FZTAdyodaE8uUF6aIt7C/+lkLwdCf9e0Tx0=; b=jDJnZsDxTk3QUCNAUczG2ZVYGt
	ERHPjEvf5hZoqDWOBxV3IfJCIP99Blal/x9xZPNE1enUx7jDq6su1qntabdN9bZ3lxmA0TQxyxZRI
	VYrr3dkS/nDdYCKEgu4dC6rIl4GzPQtI0jja/C/9rxIqLVrNoCdIAONGwXj/kZTzH7YvHYkbq6XsB
	yf2H6QUNllPoT1T4bgUulFmsOmGdWGnRricAx87p61yCP+35IDFlkgHaJWxpIzacACpiKOVQDFBNU
	VikR8Y2i9NGnVy4JknfvVZ5lU8p/REJaGDd/LzVS190tTSrF+KmYqV8t2q6tySVt3OWvYvw27D5NU
	Tnw/qSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwmT-0000000BIXm-3c92
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 19:34:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwmS-0000000BIXA-0rgS
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 19:34:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VD3Swp009724
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8+dJdN9FZTAdyodaE8uUF6aIt7C/+lkLwdCf9e0Tx0=; b=lRJkoUGCo2xPR7f8
	Vrj8wj85Q3jHZVaFOAZP3hlz/kfAaGeVvReI1esY22kvueEuvj5sycBdQCJEl/P9
	ush4JQLt/kN842r0nBYZw+q7SzQr0iEh73iLG2QiGVNbZ+2JS59kgCmx/SRNfhNw
	oLFCDMSnQJGK/07UcT4L4Nyo5TUJqSjKejkEoPSaJvctVvIJoxuePrb73tCteebV
	/2ff4l7BhLa+OifDCBJh8IgxJ+o/MCXhNMh02HoNvqV+MsNr5amMsc54FXHEPc/M
	GYJnyAe1Z3mmsH8rtZoPczUafkdaeYvnlg5P/wOXPYgeif7exlgmPzkMgrTIv6cT
	D2Xt9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gy2q8wug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:34:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2161d5b3eb5so45349765ad.3
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 11:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352058; x=1738956858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8+dJdN9FZTAdyodaE8uUF6aIt7C/+lkLwdCf9e0Tx0=;
        b=SBNLlH2rCfG0C6pa0kh0ik29gi8508VOCxVpPP3kpKZlCLeqJ22D3V+08YafBN30Ws
         JXSNh9qIuNFa9IbQkPsIRgtamUn4JI86bk3atTSrzTTRp4k1p57OpczPgtd0q0ydtGS5
         mf1rSxnMZPWzszV5dJ+lpti5ftMZfI3As57F3mcRQxBfzw/jahYiS94JMlbxfcERzlsl
         wDy8mKtrinE3XZDpeqos/Gdzlr4FCVl4Hx1lzf8HeNQe83T/xihDZK2/7+epgsAznUVa
         IpZL2I0eExr+1tZpjSyersheyNcfi1rrazKwSNBXVkaxpcPl4P6XPyCUOj4FnytTJRUn
         kmJQ==
X-Gm-Message-State: AOJu0YziOHEt7N2H/aDnAE2HT6JUSt63v0vwbdtVuNxhX0Bq4MjUd/wA
	A2O7/2CuC/9e/OSZuBgqZoAfYZs9W0nf7860okJNw5WFTvmiGnsIlbm34zvWAUHCB+bf4dgykDO
	M01VreYtvrvvv6JVZRJ4xoWDUbqqCYjIaCpAvp7Y/V/HaDS3b7ey1ji0MQ7n6
X-Gm-Gg: ASbGncsk0w9shiOHpNg/tDC5G8bok+bTQbu7Ofc3BWlRbZMHGqufdQ1nxOH6IhX9x3F
	qAVSg5T0UmZRz8IrRobc4NrCSMluqMpzcbmi039OWN7cjIO7ew5uvhAv7LIz1EjwPgpvZWvAEZ9
	C2BCcrpEYNcemE/B3JlqGEdKWeZCxahidb7g1X6amJFQE0PqYxuJQJ/LvJ587ThRmkboTsNWfUM
	jFRX+QRR1fOl0aqWpHVAdgXrC/W9UBU9qFI69hvGuRJMWErZSL8nH0LkD2RKBzR0C8ETZDYcmEY
	wQiUCftub9KRQKPUlZRJBCImlQM8K15Z02tks04IPQ==
X-Received: by 2002:a17:902:ecc1:b0:216:55a1:369 with SMTP id d9443c01a7336-21dd7d7cc30mr164926005ad.18.1738352057791;
        Fri, 31 Jan 2025 11:34:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq6IeAvZhmXuG587O8ro8aWl4Ca9E8QnUMVaWmBsB9QkKGADMv3cHVb+Q7fex/oRRlCVg3hA==
X-Received: by 2002:a17:902:ecc1:b0:216:55a1:369 with SMTP id d9443c01a7336-21dd7d7cc30mr164925725ad.18.1738352057425;
        Fri, 31 Jan 2025 11:34:17 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3302a50sm33721995ad.188.2025.01.31.11.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:34:17 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250127071306.1454699-1-nico.escande@gmail.com>
References: <20250127071306.1454699-1-nico.escande@gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix
 ath12k_hal_tx_cmd_ext_desc_setup() info1 override
Message-Id: <173835205680.1098484.16094267850867670920.b4-ty@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 11:34:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: gyDHP6Jho3ffph0jzL672uvFhZYRZO6b
X-Proofpoint-ORIG-GUID: gyDHP6Jho3ffph0jzL672uvFhZYRZO6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=913 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_113420_284207_F03A6039 
X-CRM114-Status: UNSURE (   9.41  )
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


On Mon, 27 Jan 2025 08:13:06 +0100, Nicolas Escande wrote:
> Since inception there is an obvious typo laying around in
> ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
> flags to tcl_ext_cmd->info1, we initialize + override. This will be needed
> in the future to make broadcast frames work with ethernet encapsulation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
      commit: df11edfba49e5fb69f4c9e7cb76082b89c417f78

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


