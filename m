Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E51C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exlhf81r2DLo45l4osjsU8vD5u21bId9SYYdlAPYvcM=; b=tkdXZIu9WaOb/3Bc8B2AV/EeyO
	s5VKO7V9dPfJ/NRA3qw9Dga8V+LwOhphl/E34Q3Zzg+Ig8HjNO0qwgC0zwGUxthHr7LX+3qRKOL2S
	jzrvqmi+HWFR/L87iVVjEcJELS2QW147B25lquwFtFfb8zTdevSbFzBDByW1yEVmvpFmfdXM4uK2N
	yWr7UNcWsSAsAZmamj/ilR9+wfhMPNaWzyQ/jnmCoVn3IQ+VZxf0K/ELrhlZUEXQ4dp6ax+cD23lh
	VW/21IeNyV8FPLnAAFrfUXsKMcmpi6dmdEg5ZmKKlBNleqUd9B+I5JPnDkkmNP5EldetEZ32i9JD5
	jUIBvVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatTZ-0000000C5h3-1TM7
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 09:26:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatTW-0000000C5gl-3YCE
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 09:26:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-438a39e659cso4062855e9.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 01:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737624369; x=1738229169; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exlhf81r2DLo45l4osjsU8vD5u21bId9SYYdlAPYvcM=;
        b=ju0CSRk+qQXm3DJ0Cqwfp6BJimpKNfSXknNxef/uvPyEdjXhb3dyjV8fKU2EdIrG5y
         HacmlaTEcWhYRwP6UVjwYQPn8oO1F7xCIR6fkQxXryZRGzqv+FOBCwHGvwVG3U16pwD6
         TlWrKBI5IXQE5heHDULaXBEKO0zTe8cx91OKi0sIkfuQATEf7vth9XPrcDix8FPBy3X5
         HhQa7vUeR8NbJAnl8+nGsi+6micsOd637Fo5uQOTqr6mAzHsejySGv33asXLhf08dAjG
         YznGo8CRlLk1xkrmkb6fy6++HiNmVWQ2eR+YPKilsR6QH3NSffmcMTeF6trbcgX//VVm
         HnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737624369; x=1738229169;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exlhf81r2DLo45l4osjsU8vD5u21bId9SYYdlAPYvcM=;
        b=pbQ56IqibmjlqF9VroTn9O4JpbldFMP/tWJqAtAlT6UpUdMBujTSFEfh2IrBwyhvta
         qsju2iyqQkfqasN8XNnUqv/UI5qc8Wz407+LUe2zdty8RsQR//qr0ZNz16AfnsQuNyRZ
         6pf8VZ4SIXlLCaview5yEQxvHs5V4Z2FEXJayqLdfZFI7Z+aNWQaxrpyPYwO0GeAgLcb
         0hsQ7raUrG6O91+VHZuSR2L0h5VHvvdbrWnPFBTsNCDgmELMBe5etnuk+x4RKKAN1KW+
         JO15xTOdjbmBWnoxwnh38DLs4JMhAk+r9VZiOunndspZl371j2MwcxhCFs4Kb7JyVO1k
         U7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU5+xa02v+jFTB63lj3XiIyrM74M0fcz/0M8mE9uoOrm6ftWLzkGYlgZVfByPqPflqoily8vI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfL0zccSz5+O0z/mhumTPI+Yu54ZcihnNv1IwdBxFqsPyo6uAE
	E6GLb9/OiSxqVNmmRIBgpcCIjOIx887DTKC8BAKT9LQkJ1UnZL3P
X-Gm-Gg: ASbGncuXXV6AIIbKczn6TVToD58HgDsTqc5E4g5zPZWXnQMJ0dzXCD7+Pn4e1zxnZDf
	ziilbGL8jwY3HZmM1oM7TaoKlRCcW7ziMRBy3RBvX2uOxSNysa5yXtax+4Ed0g71LYxjR5qZi69
	ott7ULA2HkHnZ3cTuQE6gD0U1wu0dvs5p7NN1PWm6ePcRqmNYWaO4P6CgknYwdckT+FyJ3e1HNO
	0fEDCnGFaR/2UD4yJOVvuwAOa4LriwLgOCsQohfg2xR+H+JzZIQUJSAdaRzt5iPk5y2t0Z81Ysu
	EiuCWTFXZNJ//E7pat3qqWU=
X-Google-Smtp-Source: AGHT+IEmHLIHqv7jO8I11oxrWXr69vnHLGz3wRb2PIZ5hihqMrTHq6XurJa22x+ECqzMN/Vp9iF6aQ==
X-Received: by 2002:a05:600c:1908:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-438913dbf63mr223008635e9.13.1737624368698;
        Thu, 23 Jan 2025 01:26:08 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm18521106f8f.45.2025.01.23.01.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:26:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 10:26:07 +0100
Message-Id: <D79CFIHCW9EP.330I13I63VTFG@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx
 error path
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Aditya Kumar Singh"
 <aditya.kumar.singh@oss.qualcomm.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250122160112.3234558-1-nico.escande@gmail.com>
 <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
 <d0dfce80-3e57-4efe-8552-b18bae9e9437@oss.qualcomm.com>
 <c6b65bee-3680-4e54-9d7a-2b582461cc73@oss.qualcomm.com>
In-Reply-To: <c6b65bee-3680-4e54-9d7a-2b582461cc73@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_012610_886293_9A2459D5 
X-CRM114-Status: UNSURE (   7.71  )
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

On Wed Jan 22, 2025 at 9:19 PM CET, Jeff Johnson wrote:
> On 1/22/2025 10:20 AM, Jeff Johnson wrote:
>> On 1/22/2025 8:46 AM, Aditya Kumar Singh wrote:
>>> On 1/22/25 21:31, Nicolas Escande wrote:
>>>> When vlan support was added, we missed that when
>>>> ath12k_dp_prepare_htt_metadata returns an error we also need to free t=
he
>>>
>>> nit: Always refer function name with () for clarity.
>>>
>>>> skb holding the metadata before going on with the cleanup process.
>>>> Compile tested only.
>>>>
>>>> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
>>>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>>>> ---
>>>
>>> If there's going to be a new version please take care of above nit=20
>>> comment. Otherwise -
>>>
>>> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
>>>
>>>
>>=20
>> I'll fixup () in both subject and description
>
> fixup in pending:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=3Dp=
ending&id=3D29d6569f323a88ccb3239abea562f6e691cfd9e4

Perfect,

Thanks a lot !

