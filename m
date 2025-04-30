Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E9C369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9XI7TwnIdB//AYfT4HxLb/jD2o41WsukJJ2eFYhClU=; b=hhAehJdXxN6aimeDQTTIHSpt6v
	TxqJkpFyniXuWQ8aTkMzRnHW6sIGgXyn8LIL2lkUMH/y38tvyISMk6XgTpsZmR3Uq6fkjuMmtM2E1
	E2ysHQ40mROYsK26MKrI1tnpej+NmeUUi8UuSYog298bek5RQWVyR83D9jzzd1lbXcQ2hnmiqaf0D
	igMMJIf+rZHgta0KoGw4e5YA4+lczpJmFR25Bc6L1lVGIEx9/k2IQwxFk4fob8FoKF0K8/mHsNscv
	Kv4Fyoa5YOKU6xJM5w5i/VL9LKV9v9+/a4q0/SoNP7aSxQGeqQzKeXtAN1rb5kQApUtTLgHcGgR+B
	LAiytlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7Tq-0000000D037-40pc;
	Wed, 30 Apr 2025 13:28:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7OD-0000000Cz9n-05f5
	for ath12k@lists.infradead.org;
	Wed, 30 Apr 2025 13:22:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso36205215e9.3
        for <ath12k@lists.infradead.org>; Wed, 30 Apr 2025 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746019335; x=1746624135; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9XI7TwnIdB//AYfT4HxLb/jD2o41WsukJJ2eFYhClU=;
        b=kD/pBGLMeSHB9s874mFCVk02wb5Q/PkeehSZ/vyf/KvvA2TINMEdJxwwZu3YcUEzvm
         LV6BtLynuF2frrdtgL6YuwOOp3jI7/cr4RPDDdH/wHBf0k6fLFnDSavVK3ZAue0eUD6y
         SH2bxRZqAZHj7naTUQrNIe+MsEuy6VBJ3SajQhvf1c4JLtzFFNGRJndy7TKMcxTa/1ZT
         5tlSGHCbob8JUJb05UEknxYrvRG0YMdficTHLw/8VIKf0fi3tv+G98+gjEBnQ8EDrHBH
         t51i+FKSKVdWua/tP705kQrXVNobTLQEGJyemRqTVXr8q14U3kOIuUmiSVxC4wUGakCY
         AzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746019335; x=1746624135;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9XI7TwnIdB//AYfT4HxLb/jD2o41WsukJJ2eFYhClU=;
        b=Rq861EgFzM6iT/pYML1IbPZMyCvfPJWFSKfNaxxa/HK9W8RiOll3JpnoECwU09OnW/
         Uf4QygYgp6ffFDR7FPp6zofhN5amooUcwq6qn2Ebm6+D2jhi4FkVrywXoZJsSxDgBDu1
         kxIyt+o/01iOAWw5x2UW2IvBD/Q5mIw3sZg6tEO9H4q899jhSW6AMfE5k2r0HmFry1y7
         vrepW7Vkp3VIqTn6QglmMSYfa72RUQ7UEyLCTJhY0/EeNUkOxEYfijHNbE5oUagyGE5s
         Ew7Fo4OlEsRp5RM83AI7zk2Wqet2lLMasCaA/h+OqAuM7TN4o9rR2QnYGE9dI/4oTRVJ
         6m6Q==
X-Gm-Message-State: AOJu0YyOSd2cDpbrS3iEFgeHD1Ijlk0Z3ZYFh+ufh6c+iq8Z5BCwJVrs
	7JAoU7iCDNuPMR6uAlUOQ26uy9RvOUsQMKxfUB+y0nJuaasUiqVfIZKyNA==
X-Gm-Gg: ASbGncvd0DI3OMJsjxavOfBS/axLO5MhLMBlp/opBnFTuwk8jkmosIrAhAtzN6jSKi+
	Vk9Mo6HmQn6pq4EDTqcBRcMadqluYtTC2zLfZ4JQRJmKS4oiSYK320I5EdXmYuJpsUaj9E5YZ8Q
	mbB4xVX2gjcbH/c57mkREb90xu+Ok1kGlC7faa/m/0i5lJO/iR2KHwMSDnKi5lxO7vu+g8KzMe4
	KG5jz4V34t4cRg9MqtvV/Wzyj/cQVCmy75BLCD8WSVaG6N58JnZNv3ACup/QD8rxUxzX+16WWWl
	3CGg0quYA1Lfuu6wgE3av1MlniObAswNqJM2wxRUlKgFdX50bwck9xAgT6CyUzHCC3QkZQ==
X-Google-Smtp-Source: AGHT+IHkLoaDVPuNXpYBeFjk7adJ2UNck99kApNB1igcfQ3b7PSh5HVmhGcehW737tD5sqzIHWidZA==
X-Received: by 2002:a05:600c:1e1b:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441b1f2ff03mr31634215e9.2.1746019334421;
        Wed, 30 Apr 2025 06:22:14 -0700 (PDT)
Received: from [10.0.1.16] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b287desm25375535e9.38.2025.04.30.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:22:14 -0700 (PDT)
Message-ID: <c3e75c695e8b8d58dabffbe00b8fc58db75d9a23.camel@gmail.com>
Subject: wifi: ath12k: status of AP + STA concurrency (DBS) support on
 WCN7850 hw2.0
From: Parth Panchoil <parth105105@gmail.com>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 30 Apr 2025 15:22:12 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_062217_062268_142EDB16 
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

Hello everyone,

I am testing the ath12k driver (ath-202504172310 tag) with mainline
firmware on WCN7850 hw2.0 using the SX-PCEBE Wi-Fi module, and noticed
that AP + STA concurrency (DBS mode) does not appear to be working.

Could someone clarify whether this feature is currently supported in
the mainline driver and firmware, or if it=E2=80=99s still under developmen=
t?

Silex SX-PCEBE module reference:
https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx=
-pcebe

Thank you.

Regards,
Parth P

