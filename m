Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5F5C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leqKbwMt0mzH1Or8tB3mPpZm5imjxV6Xh5iC17lZK8s=; b=rS27xchxNXj4rppeE2H5Dq4jQO
	16yY3kaO5JGEwtcyUklKnZ5CGNYqzBM4r4ZXF/znFQANHzgBgOQ8xKXAUFIMNjSkDVtNYS34zclJR
	gSe3EY+vzh6LVrAMgNjDBnP3Uos8i+knZtv++ja8uNYhee5gnbhHj53I7vDe1FjyCrMb+RgCpeZsp
	mSZBoHyZ7RhdnfJANt//EQrhARiGvji1EU7wMk+lFPgAsttVtNuTejHYI3vHgc2M4mw90SaWLUWjF
	7PfVuQh2g+7CM7Y6lVUrX0TYj95Y+LaoYzmhuK98/rP0EC0R4QWBu25gFm1rpfko+edpZ79lX8gMV
	qRfGPtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmeY-0000000Gl6v-08BM
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 20:21:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmeV-0000000Gl6b-3nlP
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 20:21:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1604878f8f.2
        for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737836470; x=1738441270; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leqKbwMt0mzH1Or8tB3mPpZm5imjxV6Xh5iC17lZK8s=;
        b=eF94eGEebJ5+uVETebtiviQSGx+b+XSah4H0J5V81kiI+DXnKwEvAB7fhj6AWiHLb2
         BNvw6J4HlOAxYACHuzqjB3khbS4LF0Phl6duYBfqmRQbPSaEu6/i95hL/a1QC0zI51sc
         VqVc8GbNVTQltWs2IULRmznK8MsfRM/iKcqm3TyfvjitNQ3cD39EWpoVTdcQ+z5JREfm
         AnRAcalefiRt0etKSHRKtQgIBJHMvpMMiJtumvW5afOrUroq5GlBvul3HGcpzJAX4OuD
         abY6n2Nhp+aHSJulprrZv8TUPYOTverohL2QgiELqUddYVdaqKvrcThMgkkoVMDw4p3J
         wQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737836470; x=1738441270;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leqKbwMt0mzH1Or8tB3mPpZm5imjxV6Xh5iC17lZK8s=;
        b=KxYBpPxXjednW5hGsx416AwTY1VL48vsyzhn1kwwdzB5iLHS5y/gbDmG3nf1bZEvMC
         ZVIIvqUu/8SDTw3G1qVjhNZpyoOztC+bAb4F5AEEBfGS0YmEEwC2LpUrSKV3GNZTwsgR
         aFJakVvRFYrPS0oiqpKhvinz4u/y5SzrvQ01gYlmjXmqvgz2SzmFEtN0wpvY30D3UIJt
         9WrdZjkLSWBwQmwutQRRfPr1lJVwSpXc4r1SuaReTsO/ethtIP/upp6HpzaAtAB9WmTL
         WT91F1/HdRFTPdrbxrFDD5D60B4onzG4cklWzPr9UxSTl8C756RTJcR0muUbSBmN24EG
         /UHg==
X-Forwarded-Encrypted: i=1; AJvYcCUMvKl2C5UE0ZGlrc1qLNYdMMZeX7dfm0iYI8NeTQvRi6zdBvJoCXA7xn4Sh+qmF+vGZQVy56o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzat9LxgjWvw8qe8hiWZm1laWAvYm/Y6GgugIvfIxnjvxGBOW1A
	gRCXQ3voClcHwn61tQIzwQKW7/8043K0UZ27+hUd33gNTGmcPIsp
X-Gm-Gg: ASbGncu+dMSd9RsAPwcWGTc6aygLaderjc/TxLaJEzW+VgDcNmJWX69YFf4unFt7L0q
	PNadoZo609gwKHqY9ER02iD7c/1Z3V3t5gES4I7krPghYNBui1QAkCWWgKzQl6rJEKvg6EEW3qN
	I6fsX3lBmYuKpyGj/ejkguc8Uf1k6/U0C8knl8QDCMv9czBAAVGArOmH72ZTtrDtz4OELsvrSZ6
	aQG4wen77LIfzvlSFUZd+WfbRVRpmOsYTLXmWaRPC83pgULfVAuqMdK3Bhrias4K7OVsA85Ny+b
	ml2PUiT2pDDNaJrDTQuGxSo=
X-Google-Smtp-Source: AGHT+IE3cfWRrTDOE3p9zhRsIFujk5JuftUkB3l5GtxOWc4aOKBxs7VMtSwBIX/9UabuFTogOWYj9w==
X-Received: by 2002:a5d:4f8f:0:b0:386:4a24:18f2 with SMTP id ffacd0b85a97d-38bf566f3d7mr27789430f8f.25.1737836469783;
        Sat, 25 Jan 2025 12:21:09 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4199sm6245615f8f.89.2025.01.25.12.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 12:21:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jan 2025 21:21:08 +0100
Message-Id: <D7BFM42HW2NL.2IZS207VTCTJN@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fbx: fix
 ath12k_hal_tx_cmd_ext_desc_setup() info1 override
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>, "Karthikeyan
 Periyasamy" <quic_periyasa@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250124113352.93638-1-nico.escande@gmail.com>
 <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
 <D7B63ACJOYD0.1XBZ5VB991KOW@gmail.com>
 <18b47227-6b77-a029-2e80-04a0455ac091@quicinc.com>
In-Reply-To: <18b47227-6b77-a029-2e80-04a0455ac091@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_122111_941756_FECDB07A 
X-CRM114-Status: GOOD (  12.10  )
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

On Sat Jan 25, 2025 at 3:54 PM CET, Vasanthakumar Thiagarajan wrote:
>
>
> On 1/25/2025 6:23 PM, Nicolas Escande wrote:
>> On Fri Jan 24, 2025 at 4:31 PM CET, Karthikeyan Periyasamy wrote:
>>> On 1/24/2025 5:03 PM, Nicolas Escande wrote:
>>>> Since inception there is an obvious typo laying around in
>>>> ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
>>>> flags to tcl_ext_cmd->info1, we initialize + override. This is needed =
to
>>>> make broadcast frames work with ethernet encapsulation.
>>>>
>>>
>>> SUPPORTS_TX_ENCAP_OFFLOAD not yet advertised by ath12k. How it work wit=
h
>>> ethernet encapsulation ?
>>=20
>> Yes indeed, I made a small patch that adds the right hw features via a m=
odule
>> param like one of your CLO patches did:
>>=20
>> +       if (ath12k_frame_mode =3D=3D ATH12K_HW_TXRX_ETHERNET) {
>> +               ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
>> +               ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
>> +       }
>> +
>>=20
>> But maybe as this feature is not yet enabled upstream I need remove the =
fixes
>> tag ? After all It seems that in native wifi this bug causes no harm...
>>=20
>
> That's right, also you may want to remove fbx prefix in the patch title
> as this change has nothing to do with any particular platform/hardware.
Yep indeed that fbx thing is an oversight on my part. I'll send an updated =
v2.

So You guys prefer I remove the fixes tag then ?

>
> Vasanth

