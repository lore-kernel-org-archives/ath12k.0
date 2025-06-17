Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E13C71157
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUL7CroyrpZf6btOL7w3xb0NqyXrGo9D++p4e6dJYhc=; b=Xwrsms7hLdJM5paDMTyJbIs9qx
	5r/Wmiqy6tOxlTKJno0hUrE+oUW323LjJGiq7F+56rNHOYXn9fHlBoMfXrSfYmdi5AeQCUUj0rYrY
	A7ODy48n1R6zZKdcXaWjcpQU11vTsySsB+pedEPME4g2ZVAQg43BRMvtcHQMMtRg69DOYpiwlA9x+
	hSU/T2i3Qeg/JhpjuU4zal5MVyfiJFwYtQAbQu5530O612VqyXNCjw6LDPT6cLqtmOab/0acldWyt
	UXcTXZNngznfudnIF8D6+rrKc6EKgNGZu2XX+EiHXUkoPZ+OhEbCFi98ch2MUOPiqMeXKayJejFgV
	UYdBxwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfnG-00000008ckJ-3qUR;
	Tue, 17 Jun 2025 23:32:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfmu-00000008chY-3zzT
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 23:32:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDOPrJ022895
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 23:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUL7CroyrpZf6btOL7w3xb0NqyXrGo9D++p4e6dJYhc=; b=LgsAfPqgqyni7jWW
	EKLz5N88ZA7ADl8qF9GZXx+FdFwJGZhlFcy8zrOxVgG3HVtt9I6kgcrzvr7Gh2Dw
	BVucyvca63lBcHAaCIyRwbS93/A0xqJNpF9mNhSpqYIHhkPzwqDdVbhBgnv8suoz
	UlXPKPVUqz+ivkCWnXQSxaDX9XkvdGgznBVPifWWjOp9KgEkxJcHwiP540cxY6It
	KJpsg/V/bBzs4OHUcv3k+Ib22sRTu27kTiyJKQy5a2z+A0cH2Pd/tzeLLUIBMoUF
	nBJ3eS/pXPBKiTGXjt4MXgAplIIOWBH4TB6JMeAGMTcRujUrhG/87JQOnD6ljFxo
	2hryCw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd2616-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 23:32:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af59547f55bso3697640a12.0
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203139; x=1750807939;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUL7CroyrpZf6btOL7w3xb0NqyXrGo9D++p4e6dJYhc=;
        b=Nzxw92pJKJf8EtPaHOXq7mHZB4jXIgUsxm8TSlwazBNWFmygDPRFcmEXu9Kvp/rd8X
         TfkpkObf0w7S9iPPhgb8yFtv7CZkHxUqdOXPmmndtiRSVQ0YVVvvBC7ziK/fRl7T8aYa
         KBYKbkmpEO1GXI3L72dpBTU5aD7ASUT790g8majIU9xikoFXH/qxoPwqr/04eUA7//CH
         32v/XrRysBmooWChYGyGIewxC3RQ2qUYUa/L5sEPZUcsz2EY28Fo6ZG0oUTUG46JaN7F
         ERCR4kA28WKWsPCCYJHMqht96y6o5E3FYtCM2/YZXUh0lhMYo5Iku2CyTx0Pk5RD86Wu
         acQA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NUDBoSaQAEzYn5SEKMc02fyEWwuh63fmKxLqwEVdw8rxUx1acZgQDCYhRiX957+Y1mqmT+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOYTlbkb5UhbleWZZyHFLyVUXx6sk0xjO9S1FCuQSSMK0M2ia
	WcyCAdsydQaNtFx2TfeslCYpDrFFFI8UZBCVzDQJgLpu55BNOeLt0ENgq8FTNEILqrS1nRo6vWh
	aPi/YbvtH7wF6uG7iWYa+q4/8fK54lnH0RpfPvc7cTRaFKlSiHKUyD3g271K2ngEW
X-Gm-Gg: ASbGncunOkBsHuK6zJAMFSUIqa++KVB+H2THmgynXiTjOrtaU/omQqcLDWLTL1s2diY
	Fe7X03zN6YlKwEBhmB4rM3jM24GbVVeNn8LRERJIzUWHEmr0WCdKQ0VQWGIWTtRlqiCsfzrwIsh
	+vTM4FFmZ4A8HO9V3tRCb+wT1EY06aNl6k/wS8to49nMg242roxrreMmYBeSwsLZGBgyZ5KOfd/
	FQG0Cu5H8azqUtGu5SNj6FmtEvyYZqLGIDv0tRnZ093Dx01n/v/ZAVYddnAIINzNkz85icsXoUX
	p0jQiSRaKbSNmCkSR0aYelAQe+0joKBrDdkPL+OTqjldGGoeHqO59u9uFVs=
X-Received: by 2002:a17:90b:1dcf:b0:311:b5ac:6f6b with SMTP id 98e67ed59e1d1-313f1ca3a91mr25943762a91.9.1750203139284;
        Tue, 17 Jun 2025 16:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLipJpoM80vKlOqw1gaHg58pnt9kyoTUloinNoXItVvcxbbGa8jPFnicyxoYhInuo1UjPCQ==
X-Received: by 2002:a17:90b:1dcf:b0:311:b5ac:6f6b with SMTP id 98e67ed59e1d1-313f1ca3a91mr25943713a91.9.1750203138833;
        Tue, 17 Jun 2025 16:32:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling
 VDEV_STAT and BCN_STAT
Message-Id: <175020313777.3793705.9220172332163404030.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX6PJu5GfQZqQf
 5wtm3WMrjG6z7mw6qOtc0XCYno7LmbP3P5fFeK2wp9zD0odgS4+55skxPXQBqW/Yx1hoD7J+LGT
 p4G4kM8JLh9RLr6LtK/TwWan939ehMbqSiaNvRy35blLYYlQ4XsobdRvwqxjr+LXf9ErI5cqJYW
 0zXPeZNZ5Ex67ZOBC3Cj/HRahuMLB8x1W4QSwms/QWKg6yf2KCVYSW4PFZ2Dmcxb60dx7E/Uira
 FVm+IfsYQIoRreWvkO+dRx2jbnBl6f+knWn4UefHYi+/Dhwm+kAsdGhU07cT8aYjg6MDb83ZXqc
 bDoFIo08EvjadXhE9gNzW4zs0bH9bRsEqGDg2gY5U7m+lHDrWw6B2NRLdnxxT4CU77AGgQPLBvU
 mvD8oTAKdPPr+OLwjqoSVRCa1d2OouJEquoJwnuEYWdPvJQOZPyCsRbITwIetmcDJq90RU3J
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6851fb04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=srnEmxFwYOmbeGIj9OsA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4CF9SdjHFSOsggMCjnYX15CyVnDwJA3s
X-Proofpoint-GUID: 4CF9SdjHFSOsggMCjnYX15CyVnDwJA3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_163221_016359_0DD18CC9 
X-CRM114-Status: GOOD (  10.40  )
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


On Mon, 09 Jun 2025 22:06:22 -0500, Bjorn Andersson wrote:
> When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> recently refactored stats code can cause any user space application
> (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> stats are read.
> 
> Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> merging the additional logic into ath12k_mac_get_fw_stats().
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT
      commit: 18ae7d0cdd76420e80f6ab15ada063708f14ba40

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


