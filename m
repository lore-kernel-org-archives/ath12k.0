Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD9C8303C
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNVCTZGIclUua5aJFaelM1CN9lMCU6duySJ0T/o5KMs=; b=KD0qgdd78aRCZ6D7mVegddBju4
	bi4FFHJpMU8Aodsk/nCBKW/l/l8v38N9fg4iO+99DZ20p4OgRwk85IQHeDfbFaz+qB0grNjeA21dV
	6x8dHBzykNI0Q6/gU4hDnpcFqzY34JZVFhiYPB3T3bcjFnWd7YBINDmhlJIvrJGlZOjun17TkLIgb
	oKJQ+ldx/srEtX5mpbMKoFBRq/8WAO5tJOj+yTKdGejdmAC6EIpLdsyFUqbCDJPCqvG35r9vdyOC6
	RuTyr4NX4gi4LstIbZZh/AH+mErQswJoaZD/S5a0te50Hya+2RnUk6ZCEHkq+naRbRNsVidhstlSF
	xoxU6K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2uO-00000004b9a-0nSS;
	Tue, 08 Jul 2025 07:38:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2sr-00000004ay7-1pnn
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 07:36:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso34298005e9.2
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751960215; x=1752565015; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNVCTZGIclUua5aJFaelM1CN9lMCU6duySJ0T/o5KMs=;
        b=dlTlz0dyN6dgWDcGaEFpmh2xUYL754XDFA5UTH8knLlD//ozgGEDvaIYgoZctYIPde
         TNJ4VrlC9q/pj4DPezpW3Q0+vW5aGj6B3CElsDFach55WUy4htoVPfcnpMSsECXPDNlZ
         9YD82zhaK4VPzLnZuhf1+9sp3nZnKA34jJum6ypbga37kk4v0kOu4CpKgZ1UCuH5cnjG
         iltvshtiXbz8qplE8AluqEt42tb3dgrYGTaIMCtX29b+hMt7oKC95Ys0pgJaO6fl9hAn
         Ykv/QTeme3Ziu4687N7tjwcuKBp5SOrj2S/a+0kYMOJY2YFSu9fJOmXKcL2XBI9tduDg
         /Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960215; x=1752565015;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jNVCTZGIclUua5aJFaelM1CN9lMCU6duySJ0T/o5KMs=;
        b=SAOPP9DyqG/7ljIOAS+Vt9NFxRVHgX2Vy+b/GQ50+3ADt7h7ZgnwBJSIOpZ3r7hCMs
         gjTINmRd0xP4CbPwtahD8P23jYWgchp9V5FL7zH9X5vwMyGyQvQ7+eYc/DtTKnquRsjO
         j6eXuCdqkfyJ0MBaL9UNwvLQSRRBtknrdYTkdOOMqcrlShvc3pk4qDr1Oycf23Hzltqv
         cphDgGOqulOOXAX4vUW3MoJ3SrZn/2RTX6q5Pa9fGcpYfOcakEqGiN2xtNzJ12aZRiSU
         ZrMdBQWzL7gCWMXEKp4QGNZOfn5k9Lob51WJtziTbq8PUnGD4JU6HuAHduk+MSaDoddo
         h8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQV3/WHEURb3AKNj3cXxYYXu2ERa2Csdpl4bR3giy2okIxJxY7y+y3kelezS83iTUU+mr8AI4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3HAt64QCjgKagaHluEiy0FnkDk/D7D7olzSNKAvKKNu5btuFL
	ZK9dh3Z1QdyIbXruHCjHCdW6A+XRVlik5nxCyvQC1+HW7D9Ge/7lzlWv
X-Gm-Gg: ASbGncugCSDwTkrKImWeRsXe4xg0Q7OO91uhkQ/L0xroO85RhvpGF1UnwZtZLDXaIsJ
	ebNMApc7m306pjNkZtYi7yQzUp+iLJ+3TO1E9gVa44nut2HPulrBTnsq7qK0Sz5bfC9bXgPpNSd
	QEMg8sKoJFTDEaKKTLAbIw/soFi4uJwiYiamUUsxExwK499epIA0OQlyqDAkBtHkH1hDV59Rwlu
	G0GFsxfBsZqPbnHSs72K6bHJTU8kNHVAVwagu18YMBRHBmFl0fsVo52wkUxf/vntqerEQuacGvK
	FfUI5OFobrUvW1kZ6MWMvZbfBa0FYSJ+tCb6Jo9jqst5pNujSu+kW/CDO3tzslsTk09vRppMofF
	dh3hXzcQQsA2OiNQ=
X-Google-Smtp-Source: AGHT+IGbc5m/A/lUy6Z44xUNmJwgghVuoXq9qnyycnPtnXCB49G3ggRKXYqVhqCYFLBssz+XP3iupA==
X-Received: by 2002:a05:6000:420d:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b497029578mr11689711f8f.37.1751960215112;
        Tue, 08 Jul 2025 00:36:55 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb31d21sm10726945e9.1.2025.07.08.00.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 00:36:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 09:36:54 +0200
Message-Id: <DB6I2BHTWU0B.1SV9BIHX8WRZY@gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: support average ack rssi in
 station dump
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Sowmiya Sree
 Elavalagan" <quic_ssreeela@quicinc.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>, "Sivashankari Madhavan"
 <quic_sivamadh@quicinc.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
 <DAKJLG9RLFCQ.3H8XQHL8ZY3GT@gmail.com>
 <10d52ab4-a0cd-445f-a23d-9396904b10df@oss.qualcomm.com>
In-Reply-To: <10d52ab4-a0cd-445f-a23d-9396904b10df@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_003657_476980_5AFF7535 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon Jul 7, 2025 at 9:05 PM CEST, Jeff Johnson wrote:
> On 6/12/2025 5:10 AM, Nicolas Escande wrote:
>> On Thu Jun 12, 2025 at 1:46 PM CEST, Sowmiya Sree Elavalagan wrote:
>>> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
>>>
>>> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
>>> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
>>> management TX completion event from WMI. Update ACK RSSI value obtained
>>> in management and data frame completion path to ieee80211_tx_info. Also
>>> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
>>> register to mac80211 layer so that ACK RSSI is added to station dump
>>> message.
>>>
>>> Example output :
>>> Station 00:03:7f:01:5c:4b (on wlp88s0)
>>>         inactive time:  46584 ms
>>>         rx bytes:       955
>>>         rx packets:     10
>>>         tx bytes:       769
>>>         tx packets:     6
>>>         tx retries:     81
>>>         tx failed:      0
>>>         rx drop misc:   0
>>>         signal:         -39 dBm
>>>         signal avg:     -40 dBm
>>>         tx bitrate:     6.0 MBit/s
>>>         tx duration:    1185 us
>>>         rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE=
-DCM 0
>>>         rx duration:    0 us
>>>         last ack signal:-41 dBm
>>>         avg ack signal: -40 dBm
>>>         authorized:     yes
>>>         authenticated:  yes
>>> 	.......
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ-3
>>>
>>> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
>>> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
>> [...]
>>> @@ -5651,6 +5655,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(st=
ruct ath12k_base *ab,
>>>  	param->pdev_id =3D ev->pdev_id;
>>>  	param->desc_id =3D ev->desc_id;
>>>  	param->status =3D ev->status;
>>> +	param->ppdu_id =3D ev->ppdu_id;
>> Hello,
>> It seems this ppdu_id is retrieved from frimware but not used in this pa=
tchset
>> Is this by design ?
>
> I'm guessing it is for completeness (parse all members even if they aren'=
t
> used). Do you think this is a problem?

Not at all from my standpoint, but I just want to make sure this was by des=
ign
and not a telltail of a missing patch.

>
> /jeff


