Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C95CD13CF
	for <ath12k@archiver.kernel.org>; Tue,  3 Sep 2024 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB8MDv5FaCjwyAMLsDObbG/PIMHmXizL+8dnJxb9JjM=; b=w8KKmL71oOObnEQ5tnPSVcDfL5
	efoDDhOdeMvaNYZVY2JvcPE+0NPMwdT+iOddtlHE0P27KTZbApSCRJ9zTbxqQHcx4brM8n1vnPknT
	LQiwhC3gYXmZdNn2Qy2NZqgGmr6a9cClcPK+Sq988MTg5s3Tpm8QPRRtz6uJZOMBgjZGKwcRagt2G
	ETUj/nC1F55W70MW+UlTKjcKx9gcIYyGX9oa3VhVQEpKptx4bdBgSO3G7EXRyjgNjXpbc4i0NCS7+
	oia/ANhIaDNeK4/crWZwNWcSn08IyfY6epu9qp2lCw9t+76Vtfm/Rb6WJ1udmjqCpTpVT8X9NomaB
	63yhkK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQIJ-0000000HGit-2B4L
	for ath12k@archiver.kernel.org;
	Tue, 03 Sep 2024 09:57:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQIH-0000000HGh8-0Dmw
	for ath12k@lists.infradead.org;
	Tue, 03 Sep 2024 09:57:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a86910caf9cso1056471466b.1
        for <ath12k@lists.infradead.org>; Tue, 03 Sep 2024 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725357467; x=1725962267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB8MDv5FaCjwyAMLsDObbG/PIMHmXizL+8dnJxb9JjM=;
        b=SaAyPHnl3qWQAlrPc+k7L4vFFsGF9pZDr9g9NQB9OhQ6jozcc+lKtgxPpadx/JQvoO
         h8zgfAGzK2O884smbiH3ANUjSdFz3Op5kPWuxtfUPjNSbjeqRfrCeG5nTu8CAIyXUqeH
         r6bX6pk7j6qj9myVnbIZxOxkPgzbhZxP0orRMQ2ybAjPeimVfBmfZLE2ddCLypg4gi+S
         3mQ6ETSOjHX/WWf+DO1u+r+2JpOEVR3Y0ni305BZOtgC7Zvq73tgJumIJuLNOvqWUPKP
         Q0xluZZRuS14JP6L7sym6A9wxt26fHQAisjP+kTu8jA8jxYNHBAsPcJVnr9s8TTrRLIB
         Qstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725357467; x=1725962267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xB8MDv5FaCjwyAMLsDObbG/PIMHmXizL+8dnJxb9JjM=;
        b=OpvlDBKQWtK56fpeURWJP1XH6j31LyNf/LXW3UXQz4Et1omPebAgOM6dP8BsGwxPxE
         SXMQuReycOKZZmLKSLxLj2PAnCEscQBLNWjwphVAhgTtb4q2v5pzjf2LPau4Pz+9C84E
         sZfpOGoUGmhsxT45mSwiEctF5loQqvt8yzf/mWF1IMmrdL/2q2d1AFtIIbiadt8j/n/P
         HzGZIDZLmc+tzREtHF/6W1mo3jZne/tfDIqW9/LhKn9p7/Sv3nNzqYwdc86oLelotoRx
         amu1NvgfqqacvSO2Cq9priwyBx1WfwNkJJJC/22ocwkmUAM9AlOsmRMjwmfBIBMAyuAs
         o9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd7Sl1IiG422ABYsAfPaRpuPY37n4xHBum5phc9dsnywPlOWY8Mm65Ch25cdGffCxz0xJl0M4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjBu1d3y7XAD/tpcRQ1+dVj8xuOuULQt68wlFfDxYDOttsZkDo
	w992GAs8lFsqwVHjawmILKLn+DIhxgd3n6TX0cc5+WhyVEtaodG63quuehjn7p1i8EEdsjKHbct
	V9KSXrHMOLqmNuE+uPCNDNERz4Ko=
X-Google-Smtp-Source: AGHT+IFTFQv+73A7UbwEcb7IHwWlmFCklSOW7tm0esfMiQyxC0RVc3Th8S47OQCM675imQn77CvwVG+qmKDu4OON8qk=
X-Received: by 2002:a17:907:968e:b0:a86:8ef6:dc3d with SMTP id
 a640c23a62f3a-a89823c9d42mr1576709266b.8.1725357466382; Tue, 03 Sep 2024
 02:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com> <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com> <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com> <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com> <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com> <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com> <LO0P123MB40578B26075CD4C9C66D144BD6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <871q21kwk8.fsf@kernel.org>
In-Reply-To: <871q21kwk8.fsf@kernel.org>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Tue, 3 Sep 2024 11:57:35 +0200
Message-ID: <CAFED-j=i+jZwtFVzoiqXrVAubmDdxhqqVpAPSCRPMPoa6G_chQ@mail.gmail.com>
Subject: Re: wcn7850 issues
To: Kalle Valo <kvalo@kernel.org>
Cc: david Atkins <david@3adesign.co.uk>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_025749_117352_D6CE9C8D 
X-CRM114-Status: GOOD (  19.10  )
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

wt., 3 wrz 2024 o 09:47 Kalle Valo <kvalo@kernel.org> napisa=C5=82(a):
>
> + linux-wireless
>
> david Atkins <david@3adesign.co.uk> writes:
>
> > ...
> >> >>>         Ext Tag: EHT Operation (802.11be D3.0)
> >> >>>             Ext Tag length: 8 (Tag len: 9)
> >> >>>             Ext Tag Number: EHT Operation (802.11be D3.0) (106)
> >> >>>             EHT Operation Parameters: 0x01, EHT Operation Informat=
ion
> >> Present
> >> >>>                 .... ...1 =3D EHT Operation Information Present: T=
rue
> >> >>>                 .... ..0. =3D Disabled Subchannel Bitmap Present: =
False
> >> >>>                 .... .0.. =3D EHT Default PE Duration: False
> >> >>>                 .... 0... =3D Group Addressed BU Indication Limit:=
 False
> >> >>>                 ..00 .... =3D Group Addressed BU Indication Expone=
nt: 0
> >> >>>                 00.. .... =3D Reserved: 0x0
> >> >>>             Basic EHT-MCS And Nss Set: 0x44444444
> >> >>>             Control: 0x02, Channel Width: 80 MHz EHT BSS bandwidth
> >> >>>                 .... .010 =3D Channel Width: 80 MHz EHT BSS bandwi=
dth (2)
> >> >>>                 0000 0... =3D Reserved: 0x00
> >> >>>
> >> >>> Are you saying the ath12k driver does not support these features? =
If
> >> >>> not can
> >> >> you clarify the issue so I can raise with the AP team.
> >> >>>
> >> >> ath12k/WCN7850 supports EHT, but with NSS only 2. Here the AP
> >> >> requires NSS to be no less than 4, that is why EHT connection was d=
isabled.
> >> >
> >> > Which field is requiring NSS of 4, I'm only seeing a maximum of 4, t=
he
> >> Qualcomm windows driver will connect to the same AP, we had assumed th=
at
> >> that ath12k would do the same.
> >> Basic EHT-MCS And Nss Set: 0x44444444
> >
> > My understanding of the spec is that there are maximum numbers of
> > streams though, are you saying the AP has to advertise 0x22222222
> > which would then prevent a 4x4 client (say an extender) from
> > connecting with 4 streams? I note that the Qualcomm windows driver for
> > Hamilton works with the AP and an Intel BE200 also works both of which
> > will be in at most 2x2
>
> Did you test Intel BE200 with the Windows driver? Johannes mentioned
> that ieee80211_verify_sta_eht_mcs_support() in mac80211 checks this so I
> would assume that iwlwifi also behaves like ath12k.
>

Yes, this is AP issue - hostapd fix required - advertise 0x11111 ...
In other case station  < 4nss will drop to HE only.

BR
Janusz

