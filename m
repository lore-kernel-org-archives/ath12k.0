Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C4C54798
	for <ath12k@archiver.kernel.org>; Tue, 27 Feb 2024 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I+0f1g1tzkVdDjmucwPA0uMYtrPDAcXmN//2NYtBeQQ=; b=S3tnOwLg3g9c9HZQYSqXBYufyS
	xv2FS4kWAMwoZPKtWBQAfBPWQvlePKgbR2ax3KNol/7j0uumHZR0VMTKk09c8ON4d9tO8i0HVQamB
	VqTWDkAN3YhF4zlFF7/KH0yhtHFeS2kq+XxOvPl3ui65KC8cJTchE8RwIqwQMIUStaZDXZzNk5q/5
	QCfKar1nX2olE5dk8R6JnEUtHoI22lCy9SBDF/EMBWBQ3Ibym0LvOmT7qUtNp2Z5Vp04ITk8BqYId
	yTSZ0iPjZnpql87NHET/zhOpwV2W062+weG1rlFzmkX5CE0LKXB+GYXO1nDMBMrz7Iter8HWDZ8pI
	Q114Ulxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexvJ-00000005TiG-3qsS
	for ath12k@archiver.kernel.org;
	Tue, 27 Feb 2024 13:55:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexv6-00000005Tcj-0g2W
	for ath12k@lists.infradead.org;
	Tue, 27 Feb 2024 13:54:58 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5129e5b8cecso5236608e87.3
        for <ath12k@lists.infradead.org>; Tue, 27 Feb 2024 05:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709042092; x=1709646892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I+0f1g1tzkVdDjmucwPA0uMYtrPDAcXmN//2NYtBeQQ=;
        b=n8kug5SN7Y24AF5ZyeQ0r2NVa2ys1V8hv3M2Wnp+NxPCAxgVw+sX3mZO3iME6FsUHD
         BN5UaRQgFEvhSNAsFuil6PHBSJT5v06tbUKBfcCO5AjfmnzzcFLUWEm5GYVzp4569FQr
         brjZWFb9KAYI3JNBYhBzC3M24sOUCQ+mizeGgMWplwXeUIrPDe+8v1JTQhyhT6XNyR4g
         YB4I8xXwooBap1aO1qmPbTVY44Tt/5Zp8FE913+zX9MEO7v6aX/Y5PyIIsnx7eEEdbGN
         KRFFoc1Sz7p2rNpgfil23bXmmgCBxWONuNJBswDUgD/eNghud2Kv/2mqa7xO3WwLqEPM
         8pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709042092; x=1709646892;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+0f1g1tzkVdDjmucwPA0uMYtrPDAcXmN//2NYtBeQQ=;
        b=EvUl22zNjECj5BcDv7lwW6XCtiRfyzKBi6VeH3+cTKCTTuIKymkhAgZ8hUhPDxWT/l
         BNtiwLqLLu04PiyyCnP3xQsDcoOgluvK9FNMBkiLT2/ebCv7P4FXoV+HpXqlcADISni9
         XH7LTli7ViueTXye+rt/Ei3dP7HO16bKx2kbMVhRtjGWFN0bHikJWsQ3tfyLoO5g4vJT
         VOCsBGGbx3E88D4Jc7Yx8uwmLHNv9Tn2Ow6GXpVVAIs72w7/P3/zILGH5plEkx2fgLbC
         TW547Fs180eUjS1Kmbv3ZzQrH44BGKG5a0+UNkwPUJ8oK2Pcraf8L4+h6wecMEOFqAe6
         NpwQ==
X-Gm-Message-State: AOJu0YxGo6VHNs0zX2zcwFltjYPEzYbpwIIefX04ZqPDEsrOpTgVu5OG
	kj3lSIqH90ngClZhL+Mxa7wZxb6pUJUYi68X9ESz9Lj+7eyUPDu9jk2DPkz7lgKQpuZQ9cOU+V7
	FlkcOJIx6dvwcISjjmorSLrcEXyXFVq97hx+B4w==
X-Google-Smtp-Source: AGHT+IGOuDo0zXvmTqAu2Fm0n6j5seiS4SqWLb7/0ok0tqOeWFovEFsXMkh4PQBuQ/+OdO3dD+1R6mqChku1Yyp+ho8=
X-Received: by 2002:ac2:4471:0:b0:513:1577:3d66 with SMTP id
 y17-20020ac24471000000b0051315773d66mr179803lfl.64.1709042091588; Tue, 27 Feb
 2024 05:54:51 -0800 (PST)
MIME-Version: 1.0
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 27 Feb 2024 21:54:40 +0800
Message-ID: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
Subject: Performance of WCN7850
To: kvalo@kernel.org, quic_periyasa@quicinc.com, quic_kangyang@quicinc.com
Cc: ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_055457_239019_C82529DC 
X-CRM114-Status: UNSURE (   6.85  )
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

Hi,

I am trying to maximize the bandwidth of WCN7850. Does anyone know the
performance status of WCN7850 in mainline? It's about 160Mbps in 6GHz
band and ~600Mbps in 5GHz band on sm8650 platform in my test. The
firmware is from below links:
https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7850/hw2.0/board.bin
https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7850/hw2.0/regdb.bin

While it is ~940Mbps in both 5GHz and 6GHz band with
Android/linux6.1.25, . But the firmware names are different per log,
amss20.bin on Android. Not sure whether the driver is totally
different for Android/linux6.1.25 and mainline.

Do you have any idea that the low performance on mainline is due to
driver difference or TX/RX power configuration, or firmware version?

Thanks for your input!
Jun

