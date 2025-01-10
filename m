Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46632E77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXXAMjGMNexv8TaN0EpUXvOt3eg+aZuPHF5Bxj/TzGs=; b=yPCO32pNHqs/3A218ZXJGELby2
	vnmFrhmqCOz9ribEizJMt/99WrnfmfX9BCHWRTXvFcjcbCZPRGrDOj1h8Pj5WMmDTV3CoJ6B3YM97
	JqffaHeoF6a1X6+hkieu6kK9xeu3UrVWPruBBlyj/5o2yFhEx0l/7BL4VE1Spwfh3uP9K/NGlS/rP
	c9Z1zXozfGxt+mo0fUrLZrfm0Tk7v3e0gEFyaKQ89JXmhfQwbuxFNBZXQO1IABT0Hz20+kQQCc+xe
	j5WecMEoWKcG8uiUWWQYI10OQ6HJSFZtiVe7K/oAIsuVp5vn8LOwM0KnACr94i68ulXfjpIYwoaaw
	0x3gVtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLS0-0000000GruR-4Bpy
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 20:17:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLRy-0000000Grtj-1yZE
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 20:17:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AK7ZLT002616
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXXAMjGMNexv8TaN0EpUXvOt3eg+aZuPHF5Bxj/TzGs=; b=GxP6tFGCrIxsUZ+p
	cKREn8NQA0xpZkjxCqbC/nwHOQj8GmAh9l54kBQp7KbmbG0qgmadSXJMF/KS7FG+
	ILeQQVEOlgqSJ/5XdfAvulOb5XJJ5p3clJsIvTI7ZIVRzwNsLCZVGp0Wb38hQQdR
	DC+HIH/O0KgKcemxdCJzlfVXkdYEoNxtzIxuGRISINpCNkpkqFhjtgB5T7ZJ29zz
	lvIPXOGoxZDWuAVwCs1YCaNtgomXsV5rkcqkDO93PdgqBGYZVAXjc1zdFdXyjtNg
	4nG2kmrooA7DigBPVY2QCLAcon/dqjnRIWzDbdVhr/lkZTb9UX5bq6+GaTONV6yK
	vXWvkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443aah80ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:17:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21681a2c0d5so44272715ad.2
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 12:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736540264; x=1737145064;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXXAMjGMNexv8TaN0EpUXvOt3eg+aZuPHF5Bxj/TzGs=;
        b=eAnozyV5255TX4ZhdfffWNmhvKKRVNDiR3+8FowgFDcaCzYjhvnIzV5/DyEsAEz+2Y
         zf7gxuhqIsIZ2u5I632ofYHprVumf7CqZNwi+Q2lfpIfWZBvMY70Lz6VG4vVeas5U2FK
         Yu2w/wNi0A4XsVD7u9TaLmkJU+YyIWz+yJShK+ec96Ll6iCd4+Hq5EBWWay4AaWt0Dv4
         WR5TgsymMjD8S5YbLRCh86CVgd8ebakDiwo0y8g1n+4szlFx0JEi5z6Zge9ltR3/SfzO
         fFONexEZ9EaSbDxeXBtlp/B4OCYaIAtliqnIsELtBUwsddeWAayGvfvCk7chxebnDoHn
         LczA==
X-Gm-Message-State: AOJu0YxWA7MNdr5/qHr6Pz2kocMucxU5bUl6z0SEwGm43LFNekHJa12+
	jPZlODFX6ATp7dH7PGjRq9Y6VkyRLLR7nFE4vYHa1CnmjEu7TglcZeUn8YLyS84I6lDzvLdW/GD
	SSLOE+rzmXd10bmb3dOMXePmS3m2uK7SPOFZHbEyH9m96zKAt9XkekfaOGIxC
X-Gm-Gg: ASbGnctrFTPxT5HJnCRzzdyn/J7gG7jB/W7jlY5Z/lQ4Lw4kJ8HKWqw6QdLKCqHBa5f
	8FNKb6MdSpltIVkiu2t6BiT+vLR/uOJRSiDpuaeKA4nQGHhC5v1e/bs6pMO5D2yEPerQKOlfv48
	LM153dd4Har19emk9kHLVHGtWk6TMGRmL+j9ZhcWFa/LcoJHFVI66CVoGmcUCGjlaz6WyO9EBlV
	OCEuiC53DYC61By2MstyQuC2HKPL7j5nyMjN7YPc+6A2n08PzOAH/s9TE+sJ3sUe6WhDu3PCo1d
	l3W4Btxi9NEMAca7Vw==
X-Received: by 2002:a17:902:ea05:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-21a83f4e503mr149887365ad.18.1736540264056;
        Fri, 10 Jan 2025 12:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFusvrmhMaXoMuoC6Tq7x7SOrk1x/7gv2OK3fHfd7R5VV+UxYqlS7/5LIaAbXvsgwb20oOXMQ==
X-Received: by 2002:a17:902:ea05:b0:215:a2f2:cfbf with SMTP id d9443c01a7336-21a83f4e503mr149887135ad.18.1736540263669;
        Fri, 10 Jan 2025 12:17:43 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f97csm17208985ad.16.2025.01.10.12.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:17:43 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
References: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v5 0/2] wifi: ath12k: Support AST and Puncture Stats
Message-Id: <173654026300.2979765.6510975811832948073.b4-ty@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 12:17:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: Z3PJnZUSo_A3S2jRjxxIVJuKorp1zSOM
X-Proofpoint-ORIG-GUID: Z3PJnZUSo_A3S2jRjxxIVJuKorp1zSOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=771 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_121746_638096_9DDD6D46 
X-CRM114-Status: UNSURE (   8.08  )
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


On Wed, 18 Dec 2024 09:27:09 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 41 and 46 from firmware. These
> stats give Address Search Table(AST) entries stats and pdev puncture
> stats, respectively.
> 
> Depends-on:
> [PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
> Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Support AST Entry Stats
      commit: 89699f029cd42ddf913a201c917ce4f7b213b068
[2/2] wifi: ath12k: Support pdev Puncture Stats
      commit: f647dc6512efa88bd1a3dc2444a9d1ea170f4045

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


