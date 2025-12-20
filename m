Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E1FE668B8
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=; b=M+OcRfHCqKpZrHoQLwI8Rsz15F
	22+HzGErD3HVptb71Xq3MjahqHIX4Ya0STXpDFu7fZwJQ1x938PSrczr4mvZ3Cl2i1YZYCrQrjnXJ
	mBhuonSEj+sVg2VZtopmyelPvOGiz7onXYzTSRf732ibbc9/P6R1XkL/yqFswEU0zXyE5ruiyaYR0
	pDPl9oE9xd0TWYS5WmEPHOvjvVxRzjwa3paeCVWtXiwjEen+pHshPLZjKVsbA2OKdTDVdBYZ7y4qp
	TNTk6PZbYSrNVwkjkrTEPbdjUgKp/EdCYQ7ROzQNDKw6KmVE9csZI++EIQftNViS1tIsepvKhiXqx
	hHcFM21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzSL-0000000Bjp3-2fgq;
	Sat, 20 Dec 2025 16:05:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzSH-0000000BjoR-3XaF
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 16:05:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPMAs3197991
	for <ath12k@lists.infradead.org>; Sat, 20 Dec 2025 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=; b=powBxEObFMXZnvDe
	IOxY9M46hWsA2j+MXBX7CCNLZXhH+CxQ6crVA/TRVfWE7DBdKkng1Q0xDA/48xsE
	wCa1fy9WghsTIUP+SHdiqjFy8+wozN+HJ7xj6AtXWISF83ftIWuKUgxTQbbIP/P7
	r2r+u54/Rz69LuwCsXaSpahTDyGjxgGm+HTOzeFfV2y6Quwrvpht43l8q+CLoosX
	x5Dr0M98ObA/btre7vc6S+ASc/HXBikuyXMPM4v3qyLTgZKwzplEMsBYa3LoTqqN
	q6gzi8NIFY/RZnh2NS8gkxGX3KDKUd2v+N2JixHuaI0U2KslttK/tVr5q05J/40U
	JvTX9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36gw9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 20 Dec 2025 16:05:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cc5b548so87008376d6.0
        for <ath12k@lists.infradead.org>; Sat, 20 Dec 2025 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246716; x=1766851516; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=aboQpkTihBP8zywfBCEnJI8du/K1B7+tB2m0f9bdCyHkCm/Az1uaVXrYvC8DhLg8PA
         kJNu+qLkVrvt4BpE7OHdeZsXsOpP+kSdVZWXVTXwx8ctZLEzLIkN/Z6KsWCXQaipZI5h
         G6ZodRajvvmcvepDWEwOCAnp17uAO1Bvb3a8VPuuGcTGtJ/LzDdbxRUegBvar4k6LNTk
         /GPxMQQMpVQXnSwUe0zxRtJLQzzF+q2whrsxh0zX5Fyp+xovgaqSKeHqS7/k7ob78aTY
         Z8G+LBl9NVS7V3QTAPrWa0xRZO4gOK6YlNGmL0lSyzbKmOxerURyeySajaeUpIw8B2x+
         e6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246716; x=1766851516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx7DvDJmvBJJajgCpWJAfurGfDkcJLeLV01NkZc4hv4=;
        b=NrXzlmZnKOR/kfPwIu6A9GEwGmex6B2RS58k+Cu3RIjuob4p91FH0H/U2G/ElP+9rG
         52XTgg/1ykQ5i0UXvF5KwSN613TFYAkay0M2HHJSAEN8+YXObbZXeP+IF/jft1aR5HLf
         hsejMCb8W7Mum+tT/uaRFdT21Usz9UzNMhtm6zLuRJkXmjU7OQksgIKKjtknfYdgGKWE
         ITFbvtowdmYmwINHIOKknnra5bq2zphB6QFsEk9cbl3IK9Tn3CCq2QJCtNfxH7tTApmG
         c93yQgYofzJA14xF2OVC1xyVJzSJIErNl2hUUXmYYKyuit8nh8+3IjKfT64KI1scLTI4
         NMQg==
X-Forwarded-Encrypted: i=1; AJvYcCU3opKaHjVPcMx1frFbLBE7APSxPZuh4f3o2Bub/exe6FPp4Mc2IrjwIulocLfHUmTztifpr+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr4dgL8aNFz7n21tnYo8d+yXiFYFEP83HFmP7s5U84miTxAMoR
	j6ID+AcUmKgqPqbFMASQwrhxGHlZh5HeB+V0Str+hCw+IyLDDnbpKO+KjYn+7Otgl3PJcXyyFQ8
	4GjpFNtkeJ9TkI4RPtxviV4Vc5gWMECogMmraj246d9C2bKu0ltPquHMRvlavJ0L5
X-Gm-Gg: AY/fxX68xuB95qICOEouB6fwY0j8O/5dGUmbjGltQL3VXAyHqWWoQm0joiUrqKjB7yj
	MS1iq4LuAP4ZrZkq4Z6mv3mHO3Iem+JX04LH9q4XV1GlGpUGvqj0alymFY3V2cJdF/WqqN8A/K/
	Ga8Xn2xZZ/cKSzylJe+LKG1cb4CCndRv2j+03xn8rcIMt8Mm4rD8hWk3pFnE6YoHLFgL7N/HSwx
	nkaYyCl5bjipiGSM9agyay8cd0jFI4gf7pKOP2UAtejbTpP5FzbF9sXiSryoLesX/NLbrpSbdNy
	XS5FDzCjEyWj3IucCkKPRj+5fAU3n2lf3lmD4Z4Y3+NYDqITn7ZcETnZPn6MHNDUczE39gjIf/H
	rveHODI6DsMsMpczfZEn6It5+H1kB/W7hCO+gisraWqSl+BWP0fNZH/dvk/08OLV8CLs/uqMA6s
	JJsy+SVo4TxRpFlVjiJzqCc1k=
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104916576d6.0.1766246715949;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Whl4rMKWU7yncCxutDz2fSapgwvmZZq0Bmc+w/O5q1n+gdugc2XguNuuCW4HIlwTrQY/WQ==
X-Received: by 2002:a05:6214:4983:b0:888:7dec:11ff with SMTP id 6a1803df08f44-88d7f5b4884mr104915726d6.0.1766246715402;
        Sat, 20 Dec 2025 08:05:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d07sm1613067e87.62.2025.12.20.08.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:05:14 -0800 (PST)
Date: Sat, 20 Dec 2025 18:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
Message-ID: <elgdbinyzunhgxaqy432qzxb65qb6yuheiimwutxdtf6q6jjpc@dgcnk3bgwqij>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX3lemcMpG9SDv
 JlzHR2IGAHOs4UjS4ooewiWjRST3NmfjlDR8YYnlwmTQ2hzY0wXVgi+NMmW5akrNaJTbHIBQzcT
 GJaX+tO3887qe/SdGfEIrkOAqr03709GNXDPudPJLrLa84g2AWlS0fqq9ISd3boz7QLcsHuNi9l
 mf6aUHQ/a1qFU21j4qeyvQBH6vtggeerGXuuQzrpoFO3V0ssGJg+szC5SYmJYCRA1Y4i5wWjObn
 6uIpU5Uz1CgxU02WM1qZR4tdsssgHZFIbD1DbuyCK56UldRNLBJgPFE27k11Qn/yLqpTK1thpOH
 pdrIYhJ+2MWXQLUjSBIWorQU+J9GGPrTYOlxOnsMGVCAVXi1jkE+ZNS6x9HbZwH6LOodaz3NM7n
 FR+GbYoLn7V7vvQoY6Znub38jRv09McFtWr9ii7C5xTC5fz6oJgsYA25+9HfPAzKtwZ2OI0mO7t
 b+F4OFCWDOZveNgHUGA==
X-Proofpoint-GUID: O0eIs9GvuGurqfugQvf9f2TAn3SWlkfK
X-Proofpoint-ORIG-GUID: O0eIs9GvuGurqfugQvf9f2TAn3SWlkfK
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6946c93c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=QPAgtUUt1aV8ZuakPV0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_080517_911282_FB9B0C54 
X-CRM114-Status: GOOD (  33.13  )
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

On Sat, Dec 20, 2025 at 10:12:14AM +0100, Krzysztof Kozlowski wrote:
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> > On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
> > > From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > 
> > > For some devices, Wi-Fi is entirely hard blocked by default making
> > > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > > on those models.
> > > 
> > > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > > disabling specific features based on ACPI bitflag") added a way to
> > > support features set via ACPI, including the DISABLE_RFKILL bit.
> > > 
> > > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > > equivalent for devices described by a Devicetree instead of ACPI.
> > > 
> > > Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > @@ -29,6 +29,12 @@ properties:
> > >         different 5 GHz subbands. Using them incorrectly could not work or
> > >         decrease performance noticeably
> > > 
> > > +  disable-rfkill:
> > > +    type: boolean
> > > +    description:
> > > +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
> > > +      blocked by default otherwise
> > > +
> > >   additionalProperties: true
> > > 
> > >   examples:
> > > 
> > > --
> > > 2.47.3
> > > 
> > > 
> > > 
> > 
> > Is this really a hardware description though ?
> > 
> > Its really more of a logical/functional description. It tells the runtime
> > what todo, not what the hardware is.
> > 
> > You could also have a list of quirks in ath12k for this or have a user-space
> > utility look for the appropriate platform device string name and disable
> > rfkill.
> > 
> > I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
> > a compat string.
> 
> This is good point. Either this could be deducible from the compatible
> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.

One of the examples _might_ be broken-rfkill, e.g. if the chip expects
to have the actual rfkill control from the EC, but the board doesn't
provide one.

-- 
With best wishes
Dmitry

