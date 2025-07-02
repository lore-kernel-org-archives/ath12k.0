Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428EC83F09
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPM1T2LNHQfKhij9F/iyvK/25eoDUaIBSajpXKOmcoE=; b=3OFgpp+Jgg4f3kSxvg/NxfY9Zv
	aOdwKXWNSP0XLpcQ0BkX2WqL0PoHQFvvpDbFzuxAKhjKwp1rdt7RcmBTYhMsZmNPK1dnWkI30/Vru
	U9I9YagbmE/tmc0QzOsXd58ByFmRE+/YWYcqS4PxIyomBX+RSVIDldGyaVUyQJgB5SxLWWiRHiQTB
	ZS+0NHMnjbvT0wYq0kuk8eWOgeKWkIDgdCws80hesfJDH6Nqmj/BbBHk8tyQsdsWleSoqV+ojDfri
	lCPr+miDpV2eCP+ij1B1Fq+QuA63kWXMcg+FTFa5vcKcnrRQBLBqxiEWYf350DVoDWWmNHqrp3Id5
	5pUENYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0g0-000000091iA-3RMX;
	Wed, 02 Jul 2025 16:51:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyqA-00000008hQ2-2xeM
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 14:53:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso7704516a12.2
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751468017; x=1752072817; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DPM1T2LNHQfKhij9F/iyvK/25eoDUaIBSajpXKOmcoE=;
        b=XXe5xo2wv40flYfSuUREo16ZhLp1D3aMeGbtNxpDmi5n3BL4PUxSGHHQIfenqd5PMX
         hBmpWQO7PkuzlVhQ1qk5AgrcOR2KOsKT5m2Wco0tuTBrE2Z4xNMzccy9TDxWyxD3z+k/
         YnIv3q4dMyR2opnX3N4e9riozJpDihiktvGxvhCnUfv5kSD/mWMHJLP6o9OACSNpE47a
         TNlDfnw49Vyvy8Au1nYyJ0bmRzN5kN0FKLQnUlcP7PuDJ3yfa3ojdBk+2GSQapBy6JHe
         eyja4iAvFpgbARMNYrh880Fqs7Q+uddGpKTemA/LBGpNtCjaCJ9h1gsMU6XGvUPKgYuJ
         Ed8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468017; x=1752072817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPM1T2LNHQfKhij9F/iyvK/25eoDUaIBSajpXKOmcoE=;
        b=GjVL92NRsmiu9/GumKrwZJTkGAN52EeJqIMyUOF8qkI4zruN2/Nh3xA0Eg7KzOaubk
         z3xd0QZBYJl2V/Mln7Aiq4rOb7/68A1g3o7cMzmHrg6wy/9+GrFniItKI3lWk2hgJeTx
         X+4EX3lFbb5scPP82N6enABtyHyHUEYT3HSUVNMm9rAyKkiGXB7kFETprlwVhhkmO+jp
         23XTq6uZjfBEBYh/dbc6rjwVENhVZcENDe5d+wT3AhXlqYpDvTtRCRsMjUpChN7k49M8
         nu9C7Canb7uKWat4EvIE0QFzAPU+6sivFcQJBnJGyHHOOxQrFA1CojbsdkTlEVfX2lfV
         GKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2dEPYHBjRpXwRYLpjmjy9Gvw2Xb+IN9nGOd0cvqEa+VhjCtRw03axE1BZUhpMf+4PsUF6fuU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjwIKDMJq4LZrYQy/a2HcL2mEk/rPkdFduyJCUNYI1q4JgCvEF
	45nkPZgqGAq7TYpWwVOaf1igl2i1k6kZJLfN+ykkCXn5r5atjfqvd1acEtyhr26EJafnO8XlxvY
	l94fKC1U/XyUmuvul3OIdOiuIozxAmQI=
X-Gm-Gg: ASbGnct1oStfUmmUYqAxqOo6RADO64cFtEz4IFazvXm7rnR/BPASCWG8GrCAqPzkt74
	1z+RncueyUJG5IMvjD6cU6tPyME8CWb+D0H4se7eD1uoFN+S+Bi5mInFt54e09m7ib/DYMznaXr
	2ywpiLH1mWSHVzAzI5rnx8SwQukB8cflrHxQAuflSAZZxRemaG2CEq7ChT6J3N3qdkhRjMGcsDt
	g==
X-Google-Smtp-Source: AGHT+IFmjVcaAlwKjAztbNsqFiGATow/TiLkiXA3EwSVpmOxrMIFRhzcapgfz5nrrTRgAUyHU/AqUz9S6WnnECsyKnc=
X-Received: by 2002:a17:907:db16:b0:ae3:cab8:d9d8 with SMTP id
 a640c23a62f3a-ae3cab8d9f0mr175432066b.41.1751468016986; Wed, 02 Jul 2025
 07:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com> <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com> <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
 <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com>
In-Reply-To: <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com>
From: Matt Mower <mowerm@gmail.com>
Date: Wed, 2 Jul 2025 07:53:25 -0700
X-Gm-Features: Ac12FXwmRNy0XV6HfwF_miAtw-Zu6Zd6a4pUwqmVNkw4VdKWa75ipABJl-DtuBk
Message-ID: <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, will@kernel.org, joro@8bytes.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	1107521@bugs.debian.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_075338_763268_0F093EA6 
X-CRM114-Status: UNSURE (   5.40  )
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

> Matt, could you help enable verbose ath12k log to verify my guess?

Here are kernel logs with ath12k debugging enabled:
1. WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
   https://cmphys.com/ath12k/dmesg-6.12.35-ath12kdebug-fw0x100301e1-20250702.log
2. WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
   https://cmphys.com/ath12k/dmesg-6.12.35-ath12kdebug-fw0x1108811c-20250702.log

I captured these after setting CONFIG_ATH12K_DEBUG=y and running "echo
0xffffffff > /sys/module/ath12k/parameters/debug_mask" during boot
(using @reboot in crontab).

