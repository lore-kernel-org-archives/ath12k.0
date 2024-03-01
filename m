Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F3AC5478C
	for <ath12k@archiver.kernel.org>; Fri,  1 Mar 2024 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeAVx/agkN7WJ+UJOkIOduxAtp0eWStGrbnaYrxzC4c=; b=qxkGSHQuKo7Xo6LRqkdeUAOpaz
	U5Hae0iDvUclK/+j8JGo7JitHGkuFc3HoXjJgjfK4vgAiHTRW3aI+LX2+BnEEzitz7WSq10KHy0cy
	ye8F5i0W4zLt/aX949HbpFRdBOwQAKHZO0fkqX/v0VfF+UVk5SQ1Vnghtgna/XUemJAXXNc9OXNBu
	NRGtmQROi6WJKPcae9QS0Q7esYAh6cyIoyTxVbe4OE4M8Rz48MnHdWLfbJ3Ksemr6/oWKJRqV3D65
	KJrKjYwvlLeTYDgRF1dd8L8Xei6hUqniOovW3ClanQ2ecPy7E9E1AUFcAeiO3ehprfrSmRKpHPcl2
	JDVnLnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyyn-0000000H4tx-1oQx
	for ath12k@archiver.kernel.org;
	Fri, 01 Mar 2024 09:14:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyyj-0000000H4ms-02Nm
	for ath12k@lists.infradead.org;
	Fri, 01 Mar 2024 09:14:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-512e4f4e463so1849621e87.1
        for <ath12k@lists.infradead.org>; Fri, 01 Mar 2024 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709284488; x=1709889288; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeAVx/agkN7WJ+UJOkIOduxAtp0eWStGrbnaYrxzC4c=;
        b=Imn1KaWDzRz3N0e3bMsoNQBRUK46lznDiZ4S9wV+8/KDvmZmv9FODmjG9U9ywGqygQ
         pcx1RIzT4Uq1jbh1iGPqVzcUKroTDTEP2/bKW/oiewY3Qc5g3YSE2rEVw8RHy3NCM0IB
         6g4j98ef23+bsjz62VhphIEEHMo3P6SdLe0QtsvxJQL8z3CCUhiJhUX2Ga+x8VV2R6rR
         z64Tm8sHIbB4utxZuAa4mXNzWP0QRKYf8dHtQs4oWcGf/1+6AbTvA7rrQGBHa3tU192g
         EgHn9/XA/eM3uYecngUqrVqZ99FlZWvIn1RrQ52ItSmOCSFdPva6GBhQUCqRAtfIkNnT
         6d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284488; x=1709889288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeAVx/agkN7WJ+UJOkIOduxAtp0eWStGrbnaYrxzC4c=;
        b=VNklvx5cWy9KBxgTCt1ZPDxmJ/kAEeUFmVbTfg7Wa16Q0JitP3xuAAwh/BGgXBumgM
         1sVfJjLS/eGvvY99u96CdcGiSxRpVWH8l51nAJu6PMtw3Sb1LCduBvm+aCjKA4hqawhd
         bSEFzdgYfLOCpACu8PdIlPCSjdg1ZNu3TB5Zgu/4NTaJ2EUfz+l2kLUJJnaImZhTv51w
         aOw9U64YfOaher58VlY6Glv14i6qW2XFyTXxAKNqCIXIgdQ0y3m0Wi53eRaBvsv/u+8Z
         XoGC9NyfjKdRGeQg5W+C9wJgIoizeS/S+dM9VDcpGIEmxZHBk8gB+w4carNTXZ+cId4N
         cAsQ==
X-Gm-Message-State: AOJu0YzbZ4MU6Tap0PFUvbpPrYB7j1MVfptVh8uQlmexnq80sab/4bOv
	qk1uLkFceGfoKMRwjuQyfzUyfeR92dYaecXQuhAl1zx/wsWsN0TBBLZocXanIWZSBGS+ksv5z8/
	88zQTr4OlE5zOMGOD7YaslQDZvoBsgHUC+Z2lCA==
X-Google-Smtp-Source: AGHT+IHcaMy39ZYXvc2TFE66E5RRkbAEGlPs+HsptcKEcAZUtoAW2aYtenWVBdiijtfYNp7+O6H5W55+8PrdF3thagg=
X-Received: by 2002:a05:6512:1253:b0:512:cc50:c3e0 with SMTP id
 fb19-20020a056512125300b00512cc50c3e0mr921473lfb.52.1709284488497; Fri, 01
 Mar 2024 01:14:48 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
In-Reply-To: <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 1 Mar 2024 17:14:37 +0800
Message-ID: <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
Subject: 6GHz AP association failure on WCN7850
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org, quic_periyasa@quicinc.com, 
	quic_kangyang@quicinc.com
Cc: ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_011453_232758_B12A56B5 
X-CRM114-Status: UNSURE (   5.58  )
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

I see there is association failure many times when I try to connect my
6GHz AP with latest mainline Linux. Does anyone also observe it too?
Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
recommend any specific version firmware?

The issue only happens with this version firmware:
  [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
   [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
board_id 0x3d soc_id 0x40170200
   [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
fw_build_timestamp 2023-09-20 03:43 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

I do not see the issue with firmware:
[    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
fw_build_timestamp 2022-10-11 12:13 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Detail log can be found at:
https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-association-fail-log.tgz?rlkey=pg2ifnzcttzimz7vaxb7tuc6w&dl=0

Jun

