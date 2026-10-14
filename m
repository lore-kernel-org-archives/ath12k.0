Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA52CC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uo+fswLz9oveZ6W3DhX5tG0ywP5MbOglxhGNZHQEamk=; b=OfKQeRS8yRVEMJw7dFGr/HBWMf
	eH1ZZ43i6sm9SndZPsxX6UtxFoCbn1/i6yeydds/vL39vcaYD/Jm0MKXlMOs+h0skqO6iej7q8/mQ
	Xue204EXGK5tMuc9STXIKekNUAnkRHMvyK17wzipsPu3RcDQFjHt+XcB+oq2YeZwpCDvU7atFeXZ3
	Hh33HCBGb5cS/2pcmloS2/eEKcYwh6jbkWoa0qQdIIP3TiI8a25AOQ2OldKsXXiwQszrj3TBLAs9/
	vvBC/u+SGef2tlpSQ6+5qFQU+289dDo+aBbN6ZyaDKdnOjnethay/Mtma7D+6/+Pb/DRJTzxg4fYq
	GutphwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGskH-0000000EeE0-15p0;
	Wed, 14 Oct 2026 06:45:49 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGskD-0000000EeCW-3t9w
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 06:45:47 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so60772d50.2
        for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 23:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960344; cv=none;
        d=google.com; s=arc-20260327;
        b=DV2r1eJ+P4z97HjGIkXWGhzyruF34xohhlGjBib+9kv7ky4aLMb14fDxu9+HObUa9J
         NAL8iRzCC/pB1tcQ/gnPtpBjXp9VHP1O/JPUNOe9xjYT/mWxo0+dwgIr4QpPIj7vYn+T
         6lIftYBDC6n5G/jh/nmuF/lCWQvCSk2Oy8mDP+Spw1TR0Go0Pz/cJiHHJl/EzehpGP4F
         w8GyT2fMakFMbLK9U+RDfyIL+O6jDKrWAkYzZj+vdZ044bWx8nuOtdzAlhcsGt1tqYuY
         L9roz4df7PPW31H0d3b489uOjFqel431+mBebbkrMu5u9yhog2Dg4sLX+bWLwm1NVTJ5
         vPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uo+fswLz9oveZ6W3DhX5tG0ywP5MbOglxhGNZHQEamk=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=XpbwqTfJ+rrhORIAhAJdjIWPsF/9/KyMtPZAo00z2MArtQoiBMb4o52XnUasRn37qr
         YJ4bKtTflpPDmhS+IRbOIhOW0CfWW0cY2yXQBM7yKHvt3brso5WkS3Vb4QdGbI9R1maC
         drCuxNhOOr6C1MsDVQX2vxeCPmdb/CALwNG/ixafff8X4t4QlwRfs6M5kksvRHCxU/c6
         FFEUfQRiTlOTBF1VRgnkVx3DycP8/0XxH2t7I8JeEeagB74DIIVsuMQAGI212GtqLuNT
         8GcnB5sRUT7lNmcsUJ7xNetzXWiyFsZdHGXLoMe3sbclhW5q5G/jFG9GP/OUITCrD8/r
         cEsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1791960344; x=1792565144; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uo+fswLz9oveZ6W3DhX5tG0ywP5MbOglxhGNZHQEamk=;
        b=KGxOcvjKvddWEh7kezC5gXcCsrRXkglhheDVRj7hXtM97DOITlRLaVcvWxQob4iVUj
         x0FFCsOi9fx7PQjAbsohcJLd47VPLkpl3hIPaCkDyjsy43GD3NNJJWVxXWgg3DsrgjsV
         OBVYGLyBuaXHuT+JXiv5qSr9Kxu9roKcUa5FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960344; x=1792565144;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uo+fswLz9oveZ6W3DhX5tG0ywP5MbOglxhGNZHQEamk=;
        b=MjhEx557BDz++6Qlx1i6hqhDw9iBHdiS2xnTE6TVjnbTnIxjJuxHdxXQTMU7LHgpkU
         IOo7qJC4Y04QqcdJhve6eRYGeM3q1tYgPi7ocmUvCxcerhHhJatmKZMgK3q4nTkgo1lC
         nNPK+JV+dfPHms9AVd12LpLZAY4FVjBj9mrgAwoQt71bLLhfIsADMH3YcaDS07foLkGr
         Yq8KVWO9DWOiVnKQf7HoA5CyPxWoq0rwgCOHspTgmZpindcZMYlUKQ+qe1xNk+762nZQ
         zphq8aT5qL2gqmVgU6MBmJX8r7j/Wki/g2jM9mf8yjK1tP9smkSSI+2NaQsPn1gyg98L
         DMSg==
X-Gm-Message-State: AFq9FYJPGjAmIwiC2iPUeLsRmh78A5ytCgojV2luSrDRRhWs5oXIxlHS
	5Zdw9hgUfbsY5SFxgP3xDwc7erI6b6jL7rdrajlqAeJ6uXgrcupgDS0D1bvapqTXIfC0Ugdv0At
	Y6lxPVtZSW+q+j5iVL7oboHgbtXrQl8lew6eUtb7t6cvmQ1YsC2CGYj+Mxg==
X-Gm-Gg: AYBFou1j0JxmiQ3fcr9Iy1Z6mvfDD75KJqmOoWLS0EKgI5e3FA+Fru48EecI77bAUyd
	EMMJG5ITwNQ0xsegGV/FIYmlTxrFLrtRn0Fbz1emYcGWtd8L+WiYv5fjrwTLYWptVADvV/Xr3ab
	LWIkg3YG0eWBw5+uDakw5ZvaqJwt7re574Rl4bHabEP2j75Dr3XsjTcRybvEZEpUFuGjcVqI1Bm
	KLIenVbLXJEIveN4l5noKhepfZ0HHz2EToM05qni4ls+/gbGmcuiPTlJPXKEMON+NDkzRL33nK2
	B185ik+Ugwqg7egY/t2FPsIaEfHMM6BUUTygGkw+FzCGIZoaqnZBjeUS2kzN2tiwHluVtTlS5KT
	uHgl6eOVmYxf3
X-Received: by 2002:a05:690e:454a:20b0:672:cf59:f2f9 with SMTP id
 956f58d0204a3-679362a0d59mr3199469d50.101.1791960344365; Tue, 13 Oct 2026
 23:45:44 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6rCV7Lap7JWI?= <cymattchiang@snu.ac.kr>
Date: Wed, 14 Oct 2026 15:45:33 +0900
X-Gm-Features: AclHuK_8ceGnqiDh52bA-_NpnYFGBfSH-MfrbbMV_7FNB16Jo-5vv7VLOCTiUr8
Message-ID: <CA+L+KvCRFM7tzEmRB=vR-ye30fW1qQW+507D0iE56L5EocPxMw@mail.gmail.com>
Subject: WCN7850: REO soft_reorder_enable support and destination ring
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234545_968106_31B7E5A2 
X-CRM114-Status: UNSURE (   5.93  )
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

Hi all,

I am investigating REO behavior on WCN7850 hw2.0 with 5+6 GHz MLO,
using a mainline-based kernel with experimental ath12k changes.

When enabling soft_reorder_enable for TID 0 through
UPDATE_RX_REO_QUEUE, the command reports SUCCESS, but downlink UDP
reception stops after the first few packets. Reception works normally
with the flag disabled.

Firmware: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Is this mode supported on WCN7850? If so, which destination ring and
RX descriptor format does it use, and is additional host or firmware
configuration required?

We would like to deliver valid RX packets without REO sequence-gap
waiting. A reference implementation or alternative supported mode
would be helpful.

Thanks,

Matt Chiang
Seoul National University

