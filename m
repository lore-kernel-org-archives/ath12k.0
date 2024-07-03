Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A46C2BD09
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hY0/9ZM/YXqyB5o3uYII/z7Pf9Qrq7ksgaSNFP43ils=; b=eob2UUM77HKuBWlhOMVI+An6Ek
	PT4AcaZvJkDzyOvl/MPsSj/FO0BG0VQmGtJpax6K/dPi8QQ6FIpB4T5s7iXHw74zxvfFh3JIbdsxA
	9qy8biVlcwQhesImBul+AAgPzMMaAZUkQXiy3cNGKy2daTVzOMCMLIcuJvgFtqxvHrB1xQpNdwrTs
	nVo3yRwUvybH7NN+HPeTI5Ycyh6X6SY71LB9IZdAL/kD797VFAS0aKWbHwvAIMpVNf8430TDDIa8u
	CtO8CVU28oqUKeOChXj5ZfwQBES7AuNMSlF/V2wEUniQk4ce7gHM6SzSYC8A+zNk0vRbS0hFhl0HK
	HYcT5L0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOw9v-00000009XfV-3Q0T
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 09:20:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOw9t-00000009XeX-0pfA
	for ath12k@lists.infradead.org;
	Wed, 03 Jul 2024 09:20:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-58bac81f419so2182327a12.0
        for <ath12k@lists.infradead.org>; Wed, 03 Jul 2024 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719998411; x=1720603211; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hY0/9ZM/YXqyB5o3uYII/z7Pf9Qrq7ksgaSNFP43ils=;
        b=GLEMGNSpT1rp9HX9JmshInTqO2B/7HiwpK12+j2T74Q2V1qkQFh/OLikKNW43Z60nc
         Qg7fWG21gF2fbfE1cM7wU8JHnYhH3AGqJBWq4wV36qV4fAvg9GBsty9IR5+1nUukNzGf
         X8kW7oATj3LoZz+JRriplQdwRMmghliSNNJeE8t+Lp05WfAiAR0OcVImRQtgUr6wn+PV
         aVS5KlpoQon3ldYGrXry+RlyI8ZaCLZpPS1a2NaS3TLV6zgT0FhyboPf8UxEZgdi7mPI
         OE0WlU0u6c76UJ6cAbh+YXrG01s8tYNH67etUznt5koEVc/SFUAHO9FQT+sfTm2ynCxF
         6b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719998411; x=1720603211;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hY0/9ZM/YXqyB5o3uYII/z7Pf9Qrq7ksgaSNFP43ils=;
        b=pkDsGJ+DqhBJwyGo/hzqSB7AOlCGmbk6NzS3YIdBHYbaxWz/mEQLhp6MAvDJ1aTmFG
         zCHQxgdvBM3dhDidtrSBYrJqgusVWkU52UMEsqd4i3pqk1/6jUfPx1/0A5PbeNPdLuW8
         P0g4cmgQgSJhN+zOGCJWIEmbQqZVpIZ9FLID32YCOBfFQMhhMK7nrp5gwu6CPBA+ePG+
         5MTAEweSIE3Vrv5R4/p5k79lc+spJfLefEjSpa2MldasIETNn7EkRcClUhsfgo9bod3+
         eY6E0UJSHAbEbVH5bIkU6NBYF2LayYrwYAkPuBdBgMJcaQVdwB6vud+StuU+s3mmMdI5
         rGGA==
X-Gm-Message-State: AOJu0YxOxFJTpoP5WDgi966Pmcf8Y6xHX/xnozqlRvuJ0htuibzNIJyo
	3WalMf2H12HuEvrWpRZ+tfueKLDsgVlaagWOnetk7CLM9EVVxDNW9PExCTG0fk40hvKEEk4kj7o
	7ujeL2YcHHHKrJWI2jPbP+IJ7hDpgOJ6c
X-Google-Smtp-Source: AGHT+IGKRdGMfoIeFIbj+oOfmYINkr8syVbYNFxx2vv3ZMqVmjPpVozQSNTUQndwfpNau73uc0WdhOrZgM8dk2B4G94=
X-Received: by 2002:a05:6402:278d:b0:582:8078:b44a with SMTP id
 4fb4d7f45d1cf-5879c465a01mr9056634a12.0.1719998410968; Wed, 03 Jul 2024
 02:20:10 -0700 (PDT)
MIME-Version: 1.0
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Wed, 3 Jul 2024 11:19:59 +0200
Message-ID: <CAFED-jk4n61WGtBOcT2OAbtmY-QdaKT+osadhSqLGDRMV7Q-NQ@mail.gmail.com>
Subject: WCN7850 - station mode MLO/MLD support
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_022013_385786_BAFAE790 
X-CRM114-Status: UNSURE (   5.26  )
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

Hello,

I have this card:
0001:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x
Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)

and kernel
6.10.0-rc4-next

and FW
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Using it as a test client.
I don't see WIPHY_FLAG_SUPPORTS_MLO is set in the driver.
Could I simply enable it and MLO should work correctly more or less?
Or I need special firmware with MLO support?

BR
Janusz

