Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5BFC02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn0jFjrouR/ya11gISh3+rftcCO9+ETAHrvxzo67oAw=; b=qqbpphpjsvWvR9ybOCR16UcBKp
	Cvye7OCnljEX7RsTtrS7Y75vYLld+TncE59gg/i1YbQqnk0vjo3KZIU7U0Ui5d2mB9KUyApGhzXFe
	7X/Yan7LUHZXpMpcGYxHOHW7W/MRXs/JC3k+B5xXvu9RlVgWrZdEEpjMbvbaku1ZuGeINIkeVF4NR
	Pf14SVnybes/vOQ8xGlR4fRhpxS9YJTW/RYFgC9QjGlpjpJiv/D4Tt1WAGnz5cy/5G9Xz5iyStCkd
	Cbjc7dw58KgNbJsmCwriSKRvxiBekkPJKH+VLaHQzWpjGHuxbPTg62XC9u0S/qW0KvBWIP3Fyu8tI
	Q0Xw63rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d8-00000000ezZ-327E
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d5-00000000euo-1y2y
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QIRlTW007911
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn0jFjrouR/ya11gISh3+rftcCO9+ETAHrvxzo67oAw=; b=MWR8koP60H7PtoTX
	kiQxjIqmbssVuNLPbSmFKcbaTN7bmGfcjmNi14NsBgErUeSo+pTdfTM+L2QjwhwG
	c6lZTegoysYPAzxQ5nCKIHpCEB7ro09WogbS6jC2rvYtgr+IzCBPlhgIqCbpxrwS
	OCMEUcxqbGqmi0e9bRPHbkDgk4NPcGdgUlH1wFC/1+NK+lZf8q4xZ6GyoqUbQYls
	SeCDQBT2c3tvCb+4WbFj887wUzRIxB06uAf54Zh62SXWt9lr/IDSJCGfuJb63npm
	IGF6JviF/uHfRWNXkdt+BX4ciwfnMtCySINSmL3rX8JEpuw7vcHfnAi/vTuMg0/N
	K5OpQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs2hj5d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso7425770a91.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917105; x=1738521905;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn0jFjrouR/ya11gISh3+rftcCO9+ETAHrvxzo67oAw=;
        b=DqkZuTudkmQ3OzfFFWEbArgJwemiIBQ+6jh9dUJlJNnqfJtcmUPl2FuEet4et3pw6A
         5A5Hdj16vlKZ0MCIdvP3tRywyGgxGVNe+6YxQzHW+T+h/w+KrcVndCUtoGS9dZvuxG26
         JM8jjWgP67V4d+SuP97/+AgI6LrsHy0daD2vE36NcvV0M9hJmAmpnolIW/jXAKdaVlXC
         zdNJE8ZAcZbHLQTOtKJ11NH8OK+scCjyjpC5jARqwhutKEUvxN6qheJVxOIJdlfsa40D
         /rBHkO7SkiZ7JGn7e0AzlD58aOxQ80h+6T+QWHs+3QIpBTaX+ekvAift2gMQieJaG/qt
         Mz7Q==
X-Gm-Message-State: AOJu0Yz9I4hOXuqrghcAYLvoj9Aib4TjUhZS/iM7zKRaMmIH/sWCivBm
	AS8ohL0Czx7wkcSUhOOgV6x5Jo4oF2r0EsaaWCdidCvqeM+QLZ2g/JVPgFMoVgrJ+FeVTfFSSs6
	lPClnqL3tJpFztVyx4+C8OEwxnTCkTuSCvdtIsrHfv4Y1hzCcpnPlDMn+p4WDPs9d3yrN
X-Gm-Gg: ASbGncu9DV9WmzAUpF9PJaOLKOCYOBZYwvVIO5PGqbgZEGC1p+MPY6IumAKxwbB/IZ5
	2Kpty6XTMg9W3CftjGG8x/owivp/3BuDIi8YEvxNGBsfbQYI3/h4erFpGvJYFyMDM1CpaWtzjfb
	3sfuNzuoos85pKFd07RG8KwHX0xP6jNpt2c8PHF/Ra1+TRqz55j8Gkx1xcTdipBXbrIdcUvjnwT
	paoQpQR2DRPC8rP/ZPyN3ep126oEE6CuJQHkPSzBtdX130d1UvSBcpJxosD1mkXGheJP3M7/zNG
	fEUoEo2tgLsN0HWVVRAp9yd0OsNbs8S9n4SBpqYPiA==
X-Received: by 2002:a17:90b:4b8c:b0:2f4:9e8b:6aad with SMTP id 98e67ed59e1d1-2f782b11be1mr67062027a91.0.1737917105036;
        Sun, 26 Jan 2025 10:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXcIMC4aCvxan8QhmlF/x3CxGbHreVjmfuO8nC98S1aft3IPSQrxrTtva8rIx5fLZ0yhQtVg==
X-Received: by 2002:a17:90b:4b8c:b0:2f4:9e8b:6aad with SMTP id 98e67ed59e1d1-2f782b11be1mr67062011a91.0.1737917104654;
        Sun, 26 Jan 2025 10:45:04 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:04 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
References: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
Subject: Re: [PATCH ath-pending 0/3] Support to request pdev, vdev and
 beacon stats
Message-Id: <173791710409.2935553.12305963585380635854.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: X-hBGeesFWN33Rkha1Zqh56c8vJfLewJ
X-Proofpoint-GUID: X-hBGeesFWN33Rkha1Zqh56c8vJfLewJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=873 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104507_647313_92B7D9E5 
X-CRM114-Status: GOOD (  10.18  )
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


On Sat, 25 Jan 2025 00:23:27 +0530, Ramya Gnanasekar wrote:
> PDEV, VDEV and beacon stats will be maintained in firmware by
> stats module. These stats can be requested by host through
> WMI cmd on demand and can be used for debugging.
> 
> This patch creates debugfs file for each stats which sends
> request to firmware upon read and print the corresponding information.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Request vdev stats from firmware
      commit: e367c924768b11d28727efbf2a6426c7aef66f0f
[2/3] wifi: ath12k: Request beacon stats from firmware
      commit: 9fe4669ae9193b27d1d4add9a26c82dca9d59da0
[3/3] wifi: ath12k: Request pdev stats from firmware
      commit: b826ad94d89615e222a3682b02adcbe45ecbde0e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


