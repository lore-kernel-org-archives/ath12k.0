Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626B8C021B1
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/4QphJwG1HyrAQsp/zsKYho0nFyBSMSVlVRiCqJHo8=; b=ul56aFbp6KeZq/vcPJLs5YtNu5
	I1y9CbtH4CnMyaf+09+4n9KVkaOxxjzVlCpOek3269lm2ZavKOmEc0F1vhmXVhNP6d0uzaVLwJyLz
	0YS2BOcC6w3efwS9/0DSKwjsKj+bK+DbNQOUWzHlU4L9QiWee1O/+dH0YPfcJwcMaoPlRPqXxXjQz
	qkQKoSHo41RTKfgjbD3zjjnBBOjhP0jDdhsNa+bKmfPtS09nL/NjT497fBYhwMX11S+R3W8+f32Uk
	ln2IPiKQP3vkdAId/0ak4738Dr74Kr7RUrYZji9v3+2FU2UKbqWVOxQP8m9XWV3HnQPypCiVtWhrB
	65w05PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAfw-00000002EFp-0e3T
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 17:49:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAfu-00000002EFC-04Un
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 17:49:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abb79af88afso243160866b.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 09:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073764; x=1740678564; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/4QphJwG1HyrAQsp/zsKYho0nFyBSMSVlVRiCqJHo8=;
        b=D7NaT5cLN/cttnQLAjoQRwswGMAIU3cCfGZXzbfFjXEOJx0NW/g8kdv6G5+36848RZ
         W04OH7NCecGENiQSOHPwQDe4YRdipqZN9yRz9oms0l+tTaMGgy80RymZxuZXUXLVymCz
         h65raoU8tXq809+Wolm1emTp5uKp0zQofm/7nImSNSeUfqsBFA4nfQevAUBGQ6XTHXqC
         joBrkOA6Ipke/b6smAmkJrtttL0F8fssztiM7MtUsIZmKQP+ILy77SUhZoQEIRyWzIL6
         Fh5US3/eOD1mA7uTdVOeMaTORC6mYdDue1M/RbElw5F/y5n2lBrIG9DZGTf03NzyV7xa
         Xxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073764; x=1740678564;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5/4QphJwG1HyrAQsp/zsKYho0nFyBSMSVlVRiCqJHo8=;
        b=ofAYLQ/qUf1Q7pKh7Glp/00b991J/44nFKClpMSofkoIgUGH25aOP2/mSKhGOzE/Gm
         b8v7Ns6aX2mzWZ+1BCg4nl5e9oOD4oIDDWjLUsSygfHPahFrl/wYeyJodbKPhLDsRBPu
         CXCBbKqrP691Akrb6+bNXYauRtM/4Z7T6WfnDPxdolNxEYt2y3OmRAfpQtD2I1oZ07Kr
         DzwDYhHfkZlvtBEOZAoAzi9xbmecOAkT+Hf0rXbFNTgFnywLOitK6HXHB3ftjbm6P4AL
         xqsI0Hpnj903dNNPJ0WG7BwbOkVDbCItnVuFu63WL0gPAhpiOEcHtXIT71rX0tOg3reO
         NYmw==
X-Forwarded-Encrypted: i=1; AJvYcCXt4cSI7LUZ2Rtof+dUugINQRm1oDVrqNCV++yy9ejWo9GVMrODKlLP3E4gRJwCgAdUcKswgFw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAKfRz0vpaQZQ6kKEvctlAnmNJU7ZKK0IA77PF2bfvHUFHEElJ
	y5VpFNY+U9qTmJWg37vFw8qlXZbWNoTzV294uUSuefJO5LD+nNe5
X-Gm-Gg: ASbGnctB+YzbweGZ/N9vuuj35pu7YFPxM6ZhzsNz672g+mqzHBSubtXaQev42bc4ood
	q+ks0+CEF6sjRY9TUlYln6AQbyH64rKvlNZl3Mgij69U78+S9Zt6LwuVa11GhCrJMK0ts/CdL15
	6I46ug9g33vBU/uNI7ktSLvJJC9Olmkm9RmFFaXTtQkSY6siBaFUVdbQwsLcmwNx/elVOzFH6wp
	0MB/1v9OKLx1fK78INS2IXp/C9FyD4WgcWvpDX2ZiJXjgCEhHz/e8cGTMouHte38h/g1IkBBPAv
	AWr3VxSuzNlFyEW+DpI2grD2mu/suSAhYg==
X-Google-Smtp-Source: AGHT+IHBvLFV9YCRGa4EkjR9DZPJRLUAuUCeB1RKi30qwUhDu+jZCMzCdEeqctOBY/xW+LmI+p9ejQ==
X-Received: by 2002:a17:907:2d14:b0:abb:feb0:547c with SMTP id a640c23a62f3a-abc09e38f64mr24192266b.51.1740073764093;
        Thu, 20 Feb 2025 09:49:24 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322e6sm1493443966b.1.2025.02.20.09.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:49:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Feb 2025 18:49:22 +0100
Message-Id: <D7XGO35P2GEL.3PN4A2IX3LGRL@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250124113331.93476-1-nico.escande@gmail.com>
 <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
 <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
 <80a13b18-01f0-4f52-853f-bc8e3f84e91b@oss.qualcomm.com>
In-Reply-To: <80a13b18-01f0-4f52-853f-bc8e3f84e91b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_094926_050934_87028C44 
X-CRM114-Status: UNSURE (   5.27  )
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

On Thu Feb 20, 2025 at 4:46 PM CET, Jeff Johnson wrote:
>
> Fixed the subject and description in pending, please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=3Dp=
ending&id=3De5c718f0c65701ec941ab3121266f33f83ee9803

Perfect, Thanks a lot Jeff

