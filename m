Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6255FF94CB2
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 03:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2xgQwNxqZSDkOcGdlTcj5jDSu680V7dHAShR8Ti4ttk=; b=uxJt2Uj4MiwiWsAd3uusMf8efv
	uaaVrb1wIAI1Zgiz3oznlnRTbfakfz/28EwxsX6OXTAzeE0ll5jkVwdaq9nD1bgpF5tXobI63KLL3
	27tx8n7POu0abtvEWaMIxoIKyUO/V99ZdomzGl5kWsGdnD4ZxetWWRBjAxVxvOB7PjZoWx1WECEkM
	VfkNTDQILuLtpe5P60dB6wJqguWYkKwFIl9l5BlgSoaJ6dFGg4OFHTdUxN+5w3V+JzMlCFPfCdJyY
	rDn0R1v0vO26OwqczPsw5WkPV7lHS8Aaoj/DSXXfdhXdDpbw7dO79WDFIQz329Jk39KBrg6I+oqk+
	4yBLg/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFO2h-00000009XYb-0Dyd;
	Wed, 22 Apr 2026 03:14:23 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFO2d-00000009XXR-3kbf
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 03:14:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-79885f4a8ffso52133367b3.3
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 20:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776827658; cv=none;
        d=google.com; s=arc-20240605;
        b=h4Ri+qjYi/zG2yvPqoAvHL8hcvuqXu0VDTEqhGBfmBfHlzO0SNeSXaxt8ALcqUqeSj
         D7vJcyq+Ah7q8PRsPEXoR3EHezkFM9oVz2SWbU1uUnZiqu+XK+313wbcgeJjRmFf44Np
         OKGeanuakblySj47QltTCUVjtw8AZMEXdx6lXiJz1ug/Izb02IMX3SJwqOEf36JZa54K
         rdOqhxmnGr0UMUeDAEUsY2p+dmKrHW56WFKQWj0VXWsqgX3tUKOmssfCrwF7lAcXVfn8
         0pXn8pKLJaBZRZtoZDJ18c7pWwrSV1lqMe5/wPXRQhgjrEz+uR9nahO+VrZGXoo7c1X+
         XmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2xgQwNxqZSDkOcGdlTcj5jDSu680V7dHAShR8Ti4ttk=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=B1thqf7oNFVIUK7yU54KHCuYD1xmJK5p8+dYaGJdtgdPVfki0LGSVmZoaVGGQgy5SE
         uFJATJYN8psnXiIn6IdAlzEwypoMO3paFRmKmirec/lAbTnoYMPKznWKkuxF60HDmb0V
         ruD7GuUbe1t5duNvWhOVdGkxceqj/d1fAjeNlTdiR+fMzlI5TqtNMekUEMHOfHV9Kk0g
         ZdxN97iNRpsHkyES6F8LZe/NygdcNV4ONLnx6x4CiZebFeu6E0QA2tEZuuLaZT4hN69m
         PRots0yuMEFhgS9015fTjpGVg6ijvRAaiSY7beYDi/1NtC74jQ0sy5cMO+H8lDG8O/Ix
         NKgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776827658; x=1777432458; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2xgQwNxqZSDkOcGdlTcj5jDSu680V7dHAShR8Ti4ttk=;
        b=itT3zH4FIW3uBa2JhqKO/FZdsusJPqBPaJqXTDHn3mprcVPeeN3QnwJiLi4sRI3oHP
         RxR7Sx7tnAfhBrgz3scpyyNx4k1kCtVua3da0X0a6MtPJBClOp4B3VrswuV4EdvNMymG
         nxM62E4fcXxJunq01u3Zs127PQclad/w3KJ93SOAHPdFZT9t1R4RU1qyoOGJEOch2hqz
         4eDxg8qONs0Z2EAtcbyv5kEbufWCWYQ81434oAh2uI4IiqHPiCRIH+NqOJjqMiaHcdEW
         AOytUkoisKH595R+eBCuLCq8ROeQ4EJMafdk0WEtPMaht3qbk+PoDqv80xchYWDeldn5
         alhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776827658; x=1777432458;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xgQwNxqZSDkOcGdlTcj5jDSu680V7dHAShR8Ti4ttk=;
        b=RTkNIoeA81JdeZ/z2KmeOfOrFE0ab+xgJ9HM5Jy3Xi6izVFfv+Un0ATEINhkL7rHoi
         FO8iJPDBYB8o6NK8RKZ2MCadcqL3Wzp4kaMniIG4IZcZnoioR+oB/kKLebZUQPH7EZy6
         Rzpd/PGL07jWYD+3aP+VwvIAYbNDFG2hSlJo8yvRhWhK8ilHB/1uSUMOuJkPQBvdHgec
         80YcAb6yXBTEtVpALHHpWQcq1sOLHpwi0r0R+X2XZOs7gbc6CN8LGia1jXuQ13WC1U3g
         gJ9JI60d0wuVDylokrAY3tXmeXlK5IU9d55GOoF600doWVsCO/E9qMeNapQ0E6QudWWp
         RHAQ==
X-Gm-Message-State: AOJu0YxZ9r5avH5EblnqLcDA5KBLPhLuyFk3jcCSz2g/4Hw6qkWjviVQ
	bdJ+ImS/s50wVgMkL+n1b6X2ZcISYW5sXOP7MwRVKLDzFhYV199tqiioATCfjSUQ925iYeEb0sD
	MwPYZreZ+7ab7xcHltDzDFW0rvN6w25WwJhfe
X-Gm-Gg: AeBDiesOuiaKG94MNH+Er/CvRT6uVYG5mtwEhpBKjPz64p9RXARMUpbH+aqy3UTAvDv
	sJvTMYrJWmMKip6T0iP5DiY54szR6mKbJI2OQ4xBXEhURQ88oX3m0S5mPbwk/hpGOKbHeaH3Oay
	L7NHYkDoAzEYJqsCe5Eq4jJ/1aHki5Y5lFkN8kC9l0ovBWt1/Y0rTUk0LSt5b9YtUDo13NP4Cu2
	fCgNxhCR2U2o/Cuf/TdEeO5c15u2MwiQRdyXyEFa7gJ5KLcPqqQsNSXN0lWT4FImbb04r53f+fL
	m1QS6hbjUfvfYwCp3A==
X-Received: by 2002:a05:690c:d90:b0:7ba:154:87d1 with SMTP id
 00721157ae682-7ba01549f49mr185439467b3.33.1776827658115; Tue, 21 Apr 2026
 20:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Doug Brewer <brewer.doug@gmail.com>
Date: Wed, 22 Apr 2026 11:14:06 +0800
X-Gm-Features: AQROBzCR16s_Eaob2s90Qlo8G6BOh0eAp7i-xA4picjvi6vS455XUIBo9wVS7ck
Message-ID: <CAG0V13REH4kwFq+w_FJBf98NDXbajyZzReWjFu0EVzt0vn-Sxg@mail.gmail.com>
Subject: QCN9274 fails to start firmware (-110) on Linux 6.18/7.0
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_201419_962913_C44EB878 
X-CRM114-Status: UNSURE (   5.47  )
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

I'm testing Linux kernel 6.18 and 7.0, and the ath12k driver shows the
following errors:

ath12k_wifi7_pci 0001:11:00.0: BAR 0 [mem 0xf2200000-0xf23fffff 64bit]: assigned
ath12k_wifi7_pci 0001:11:00.0: enabling device (0000 -> 0002)
ath12k_wifi7_pci 0001:11:00.0: Wi-Fi 7 Hardware name: qcn9274 hw2.0
ath12k_wifi7_pci 0001:11:00.0: MSI vectors: 16
ath12k_wifi7_pci 0001:11:00.0: memory type 10 not supported
ath12k_wifi7_pci 0001:11:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id
0x401a2200
ath12k_wifi7_pci 0001:11:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-
09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICO
NZ-1
ath12k_wifi7_pci 0001:11:00.0: ignore reset dev flags 0x12
ath12k_wifi7_pci 0001:11:00.0: qmi failed set mode request, mode: 0, err = -110
ath12k_wifi7_pci 0001:11:00.0: qmi failed to send wlan fw mode:-110
ath12k_wifi7_pci 0001:11:00.0: failed to send firmware start: -110
ath12k_wifi7_pci 0001:11:00.0: failed to start firmware: -110

What could be the cause of this issue, and is there any possible
solution? Thank you.

Regards,
Doug

