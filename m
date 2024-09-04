Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5965CD4853
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-Id:
	Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZ6DMp2wA5m8L2Lt1DUWiUJZqWddh2rAB7BB1zhVRkc=; b=Aa70UaMhexATdjkOB9JMR4aHE+
	SXoilgQlXVGB3hTqaXt7K3P/qLuP6MQUJMZ43uVUbaIlRvDE0IZM1NuUmW+7Yh2CPv94TsKYnQiVa
	XwHo1KaJi4tiBeQVNVzDpbpr1ODltk+9If/V9eQIuMuDxHfyvh8zrEy3P3ks4TcO0alTr1ONW+iVM
	+zJ2IPHuQk1uUc4RVbo+oF7p81AE7psi8TRM3r5zsyXDsogIyor4pyeQcMYOzVVxIkS9T7UxSeezf
	bRTD1/XA4lM39+H+3kTQiKzQ3o9nWI/dfjQcuJ6xrv8rSUiHt7I7FLooFDPqw2bDMIS2atN8uvA01
	+iP9Fh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrVL-00000004ueC-1NI6
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 15:01:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrTo-00000004u8Q-3bOF
	for ath12k@bombadil.infradead.org;
	Wed, 04 Sep 2024 14:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Subject:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=XZ6DMp2wA5m8L2Lt1DUWiUJZqWddh2rAB7BB1zhVRkc=; b=rgRoYq1AsoLkj7AGOUBdAYi6+V
	yaMklzt9RlCTCAP6aia8Pec+7RSywinRk+iHEX/+43zpiRKVM489SX1FGGy31F5NNmhjbJr+cCpG9
	RYWaCmT+75AL0S0cKQ++IGQWK5EUu1TfiUIlLzswzJ++NPHp2rlckvWwPOy4V4FNjh0kCxo44dWFW
	FyBE0/IUpCUvRLBc/h9oPHEZndX48Slbtf6/v/BdUVYLSyrHO4ztKby5HkvvAoNAdS2adBSvIzeSX
	G0uzaJQZNiepwy0tz/4d7J47uqa9F0sxekCao2qflilHGDE534wdY+oY+oXFjUF7K8ChuYJU8WRYh
	ANmMj5HQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slrTl-00000000Gh4-1dvq
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 14:59:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374bd059b12so2722014f8f.1
        for <ath12k@lists.infradead.org>; Wed, 04 Sep 2024 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725461965; x=1726066765; darn=lists.infradead.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZ6DMp2wA5m8L2Lt1DUWiUJZqWddh2rAB7BB1zhVRkc=;
        b=asQzyix+l8UUFtFF4h1+tk0zad8m5Lt3NxK2XJSbay+BDyxzyT8RiJPuqNqbP6Z9xf
         d3rWmt+QK7Q0T6CEk7t22vNwy/QkPaxfqKQZtoOPEj69YsVzgx0i929ZTkhMDu8lz4FO
         MflD74nF938m/+ac1SL4LRGnvGVR53QDNsKr6iDeEKpvt4Tdu5QsyC+dWBLVZml9tEXz
         VyNAinNQo6WFbwidYmWSPW/h8AhASYrArYxPP6Iawzoa2EV+0Wb/OTEDomInJQ6Vz57z
         ibW1Hqy078trp+0dCibu8rNsg0DrIsur9I2AsNxC7DLav+cWGTYWDtnuFrKS+d/NbkcP
         Qorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461965; x=1726066765;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZ6DMp2wA5m8L2Lt1DUWiUJZqWddh2rAB7BB1zhVRkc=;
        b=FIotmV2L1WWTUW3zSrIUXrTcnQVD1YioDr9MCgCJ27ohfEjdqH4hVyaaRdVHmQvGXn
         DUC6LkYxYMPe+Gb+xYmKP8sz8wmw3GDdYZsoQd0ms2CDg04QHHitYo9SsAJh3gZ4+YkR
         yeKdSMNZrhZj9Yk+OpDaJswYvOAyp8mNBkExtHEPmuiCSJ4qls/10gWvzAQTmKm+k19J
         /s0W+AldQ/L4GbPRFeUEWwTNFWHsjO160/1ijLJJTorBmJdNmY0ucWjIlo5Sbe/ZgTfm
         QxPr+lhroRe3aQuMCHtsgC26aM06WC+mZZJ0O5zLVwhGQhSgazKo4k4EyRpdYNIFVb/B
         sqjw==
X-Gm-Message-State: AOJu0Yyvc/x3IrmC004Bivqhqu1ZwtsDHQ44t+dPcNt93ABGeac40Rv7
	TnuYa4rlh+Me6YyKNBE4tC9yEviPJD6S9pHY+RKJ3rZjf+/hv2aDHaNK6w==
X-Google-Smtp-Source: AGHT+IFYy5Sp07uS6lobPk2mXd142xkvz7YdumLlQefr4NfICGulWdlnEZhkpHSAW2+JKC9355SXag==
X-Received: by 2002:a5d:4088:0:b0:374:c31e:9724 with SMTP id ffacd0b85a97d-374c31e98c4mr7897794f8f.10.1725461965265;
        Wed, 04 Sep 2024 07:59:25 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee71650sm16982355f8f.40.2024.09.04.07.59.24
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:59:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Sep 2024 16:59:24 +0200
Message-Id: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
Subject: Weird layout of struct hal_rx_desc_qcn9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_155929_718783_53810435 
X-CRM114-Status: GOOD (  10.75  )
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

So I think I've stumbled upon another weird thing.

In rx_desc.h the definition of hal_rx_desc as used the firmware seems to be
varying depending on the HW and on the use of reduced metadata (with some t=
lv
registration magic that seems to select the info we retrieve, 8bytes at a t=
ime) =20

// For QCN9274 full metadata:

struct rx_msdu_end_qcn9274 {
	__le16 info0;
	__le16 phy_ppdu_id;
	__le16 ip_hdr_cksum;
	__le16 info1;
...
};

struct hal_rx_desc_qcn9274 {
	struct rx_msdu_end_qcn9274 msdu_end;
	struct rx_mpdu_start_qcn9274 mpdu_start;
	u8 msdu_payload[];
} __packed;


// For QCN9274 with reduced metadata:

struct rx_msdu_end_qcn9274_compact {
	__le64 msdu_end_tag;
	__le16 sa_sw_peer_id;
	__le16 info5;
...
};

struct hal_rx_desc_qcn9274_compact {
	struct rx_msdu_end_qcn9274_compact msdu_end;
	struct rx_mpdu_start_qcn9274_compact mpdu_start;
	u8 msdu_payload[];
} __packed;


// For WCN7850 full metadata:

struct rx_msdu_end_wcn7850 {
	__le16 info0;
	__le16 phy_ppdu_id;
	__le16 ip_hdr_cksum;
	__le16 info1;
...
};

struct hal_rx_desc_wcn7850 {
	__le64 msdu_end_tag;
	struct rx_msdu_end_wcn7850 msdu_end;
	u8 rx_padding0[RX_BE_PADDING0_BYTES];
	__le64 mpdu_start_tag;
	struct rx_mpdu_start_qcn9274 mpdu_start;
	struct rx_pkt_hdr_tlv	 pkt_hdr_tlv;
	u8 msdu_payload[];
};


Which gets then used as a generic rx desc

struct hal_rx_desc {
	union {
		struct hal_rx_desc_qcn9274 qcn9274;
		struct hal_rx_desc_qcn9274_compact qcn9274_compact;
		struct hal_rx_desc_wcn7850 wcn7850;
	} u;
} __packed;



So it seems without the quadword registration, even though qcn9274 & wcn785=
0
appears to have similar layout, the __le64 msdu_end_tag is present in the s=
truct
hal_rx_desc_wcn7850 but not in struct hal_rx_desc_qcn9274. That seems weird=
.
Would this mean that firmware always sends 8bytes of msdu_end_tag in wcn785=
0 but
not on qcn9274 ?

It seems unlikely as when using the compact layout on qcn9274 (the default =
now)
we use QCN9274_MSDU_END_WMASK with QCN9274_MSDU_END_SELECT_MSDU_END_TAG (bi=
t(0))
which seems to indicate that this 8bytes tag is part of the optional data t=
hat
we can select (or not) to be received from the firmware.

Am I missing something ? Did that even worked before switching to compact l=
ayout
for qcn9274 ?

And if it's not working as intended, what's the layout style we actually wa=
nt to
use for struct hal_rx_desc_XXX, do we want the __le64 msdu_end_tag inside t=
he
struct hal_rx_desc_XXX or inside the struct rx_msdu_end_XXX ?

Thanks

