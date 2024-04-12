Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB1C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZweRDclpMhnDM38KhYAJkWP/JZFHfum4MtfUSrlxfjA=; b=O1trO6gfNsH2027H7PIDbOIUxf
	FoNUTY7ECpwnzJqXOSblR70Dr4wEmqqB92WNQ7dzIjzEoYaLaovHCcO8UsmhsdMeAWEPcFExKPJzb
	nOC1gGmT9XJEor9plrnxDX6M1mvPtcML+ustTvtfTDg5jwqkh64Y4bsA/VAjpuqgYc3ksyXYkhrkS
	DfQAHTrkyvZ4/M32X7bebTtH2ES7jq5bR0BlhxhT/q2SczTiceVnd9reOPUrzJjvmpyviqfAa9ig9
	WKZGpT4s0fiJ2ufNzzq0b7dXILRTG7YPFDhyqABhC9C5gm8aNStrAnPFt0dsqnWUbHr3WOx8tbLeo
	93NwDMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBV6-0000000Ft9j-06oc
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 07:39:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBUv-0000000Ft4r-3ZzX
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 07:39:06 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so937002e87.2
        for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712907532; x=1713512332; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZweRDclpMhnDM38KhYAJkWP/JZFHfum4MtfUSrlxfjA=;
        b=g9cHQEdtWz+2ghPfsDkmYKzu4k3Av4ZjQiJEGTuxfD7hd6r1fade8xRl0zzu/O7l7J
         r28KZWJfSqEh3C4kuf2c6k8VF8nFkyn5ahOUiH64tNzdgL0DotvL4tx25fPYHEIpMBk2
         fSKzVSARXrK40sOrb/Im20a3Oa1rw+e5fbrXeuysH/VhfrnMGNUT55JbaD8fxSf2eg9Z
         vX2o0GEBJ8Fe9zOFaBlrUJy8opiXe3vMlUR6zooNg80Wdg8A3slI3h0nkw9OhTTnUmKW
         CsqNFpBEUh2BdSj7k/8ytHRxcHnNG5Y+O7Y4texMR+zbZj9ZsyEWcR2N66CAt8COqER4
         u8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907532; x=1713512332;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZweRDclpMhnDM38KhYAJkWP/JZFHfum4MtfUSrlxfjA=;
        b=YYsfiYdqgGNsZRGr9xa4S9fy3pPrdhrPjN5/nVBwF+a1yiHPRaLaxY1oR/rsnyh48E
         kERGcfStY6hgqeyvbD/CRLWZg5J0rL+t+b8H2ZnJzCJSPqQ6ZEN516nhT7Xij/LMTOp6
         /T5CvhEbsC5uy6Q9b1+1/BvAjQV62ntr7yldZeaX8FCjHgq0+Y5uDc5RJxj0KNPGFylK
         fCwB3PQcPehFPp5e85D5Fcb8gKYXrhNm8UDu5UF8fqlyyf3fwRGXZ22fQ2DlCr21Bups
         3153ZJKF5DVCD9luO+yvH6gv6pL+wIWo2E4DwDkFE3ygNpkENC9FzSbhO+lzw5v4Lrje
         /H7w==
X-Forwarded-Encrypted: i=1; AJvYcCVKLuJfcP1PWVZevH/YrKmpwWHJvtPvTIlrnZsrVkQIIErjoODevrD0YNlB5ASmqn9XdSw6vH2GGcsD27tDah3jCMMdLkNNJbRKSw==
X-Gm-Message-State: AOJu0Yzc6GapUXogue076ODXgCTWElM0/l9SrKEbTGO7RUGJnp1a1rrI
	WoSV8k9THvxP1Og90mRKZs1klDDx3k/B5MrcgLg0VaH4JUDyqlrk
X-Google-Smtp-Source: AGHT+IHadM7YvEPmFm4iLaXvTuWUMBcs6WGrn6s6M9ogyfcAzf9yuEKAi7TbzvHqsddAH1hDGecsJg==
X-Received: by 2002:a05:6512:3da8:b0:513:b90f:f4dd with SMTP id k40-20020a0565123da800b00513b90ff4ddmr1494010lfv.49.1712907531577;
        Fri, 12 Apr 2024 00:38:51 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b00414659ba8c2sm4800181wmq.37.2024.04.12.00.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 00:38:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 09:38:50 +0200
Message-Id: <D0HZ1KH5VJ8P.2TZZ7NNZXSJA8@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
 <mbizon@freebox.fr>, "Jeff Johnson" <quic_jjohnson@quicinc.com>, "Ben
 Greear" <greearb@candelatech.com>, "Johannes Berg"
 <johannes@sipsolutions.net>, "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
 <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
 <0cfe990b-182b-4ceb-b5b4-2989fefedb2f@quicinc.com>
 <29f7ecb6d7c208c3614f37616943d5f97bb134d3.camel@freebox.fr>
 <5fc2f2d2-7403-79d2-8909-ddda918ff8d5@quicinc.com>
 <af70ee81e583f58dada3dde87ac335137c4038b0.camel@freebox.fr>
 <6ff353e2-785a-f2ce-8d3b-acc8e79a64cf@quicinc.com>
In-Reply-To: <6ff353e2-785a-f2ce-8d3b-acc8e79a64cf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003903_379475_C443C357 
X-CRM114-Status: GOOD (  20.82  )
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

On Fri Apr 12, 2024 at 5:50 AM CEST, Vasanthakumar Thiagarajan wrote:
>
>
> On 4/11/2024 10:09 PM, Maxime Bizon wrote:
> >=20
> > On Thu, 2024-04-11 at 21:56 +0530, Vasanthakumar Thiagarajan wrote:
> >=20
> > Hello,
> >=20
> > Thanks for making it clear,
> >=20
> >=20
> >>> For example, starting a 5Ghz AP in ax-only mode, and at the same
> >>> time
> >>> creating a STA interface on 2.4GHz ?
> >=20
> >> Yes, such use cases continue to be supported in single wiphy mode.
> >=20
> > Understood, but I see some corner cases.
> >=20
> >=20
> > For example, assume two bands AP hardware, 2.4GHz and 5GHz.
> >=20
> > Previously:
> >    - phy0 is 2.4Ghz
> >    - phy1 is 5Ghz
> >    - iw phy phy0 interface create wlan0 type managed
> >    - iw dev wlan0 scan
> >=20
> > =3D> will only scan 2.4Ghz
> >=20
> >=20
> > With single phy approach:
> >    - phy0 is 2.4Ghz + 5Ghz concurrent
> >    - # iw phy phy0 interface create wlan0 type managed
> >    - # iw dev wlan0 scan
> >=20
> > =3D> will scan both bands ?
> >=20
>
> Yes, both the bands will be scanned if freq list is not given
>
> >    - <starting from previous state>
> >    - # iw phy phy0 interface create wlan1 type __ap
> >    - # hostapd -i wlan1 <config>
> >    - # iw dev wlan0 scan
> >=20
> > =3D> what will happen then ?
> >
>
> Scan will be carried out on all the radios including the one on which AP =
interface is=20
> running. Scan with freq list can be used not to disturb the radio of AP i=
nterface.
>
> > > Same goes for hostapd ACS, I assume specifying freqlist becomes
> > mandatory or we can't predict which band the AP will be on ?
> >=20
>
> If no freq list is given, ACS will run through all the bands and select a=
 channel from any=20
> of the bands. But this can be optimized to do ACS and channels selection =
on a particular=20
> band using channellist/freqlist hostapd configurations.
Hello,

And in a (very unlikely) case that there are two underlying radios that can
operate on the same frequencies, how would freqlist enable us to really sel=
ect
the underlying radio ? =20

Thanks
>
> Vasanth


