Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C58AE75446
	for <ath12k@archiver.kernel.org>; Wed, 24 Dec 2025 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=; b=OhUkVylYis4CBrwnZE0gH3DX7y
	oDp3V0i4eiIYgmes2k1lkvV7REt7Nm4nqZQRSThxRJbToznXZfyamrSu6IAJ+9J3HIezB7ZzONK5N
	qOvfze+1Augj8RA4oyooX5l5aBVx0anUhEp/xbuH7M70LtzPrji84CbDwhu3c0x7fjeKXX1eR/3fE
	ykYTzn85rI3UQeKrBfjpxKFjih2nATfOe3EnGN8eDnyyql4Cl+Gm4KZgcJ6fHPjKvT0pfMh5YDRKz
	74FsXW6FcdZlpGAKfpUJ3Em1gju5SbVCudTnryS3n7a6YprVhQmSMa1TFVZrlFIGdb26MGfNbDBa+
	i6ZdCJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLQ9-0000000GduL-04R3;
	Wed, 24 Dec 2025 09:44:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLQ6-0000000Gdtx-1y2G
	for ath12k@lists.infradead.org;
	Wed, 24 Dec 2025 09:44:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2OmNf461418
	for <ath12k@lists.infradead.org>; Wed, 24 Dec 2025 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=; b=DCRQI818VJNfhxvy
	vcwkm144QAC59iKG/n+dX/NEbry4V3bERWVgC63J830y2+IxplKJu81zvnBHVDr+
	YYxhtg3kBdrboHCwaF+Y+tHK3Xt0I2PwdEh92WqpOYFYGxANzU3pp7MnexhOL9vB
	SeFLB5G2ArFIq0saOFNc9u62sZiisH0/kXKVrEHEcas05swDUkddohEtr2op6gHR
	Y9gYRKW04/BN6XURT2F+bDBQv9FdNKyU9ds4H0NdtAyOdSeGhhDW/K7/9J/tc5qo
	Mbn1zfc7sK5GIFF7U/jCnzwbFzxqQlbYEkvQuTyz8fxGqGUZhESpB3ziQe4ZvS6B
	buSDfQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fttf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Dec 2025 09:44:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888397482so175034996d6.1
        for <ath12k@lists.infradead.org>; Wed, 24 Dec 2025 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569476; x=1767174276; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=XX/ihgt59uhKnx+lXOLcyn76NhndlTa8evlboBwMcR2Nucz5k+Vzzdp70nvSQ+rPsa
         8UG4S25rRDWyBXWYr48Y9/1gsn/K/3Cem3GRs3z9Ut1tYjjfdwgkJUe8ISC6/vr9COcd
         LWoO8dvKuczo1NDYjJ1UUjFIa5fWzg7XKEFyXxe0dxaWx1NR+aqjawkelaL+IdO87eNP
         E1gl+4qkqyUELiFs4PGmpwOreS8FBEv74vFmY0sBiIuoH3Ee4iI84tdJ/CY9m72CwyFd
         yNrxj2SfO0IkNVB3Bowmuffqa5PE5xgA58fRLqpZboaCcOh1vrP7j2ja24kfrU/L4ru1
         tf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569476; x=1767174276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=DX0kWaSh7y2SzEgj5zviFhPYe3sNWyBl+H0D9rd2w+bpoynLSnv+XY1rls4vRB5Nr7
         iETNEjEtBl+/yimkNIW23KpsUe5Dany2R/fwH/tPFQ/W0jETYO8ExUDqlvAh0HTWrmVD
         HtFVs5tRV0ws50HEG5jGVHf8gr/TuFMUF5A7EXXQGJ3DxF1BIkAYQB3mwsYWxSV019Yt
         R9dqdZZ8KJICp+z9Qnwc6PMvVYp7bprcyvcBUE/sTE0rUyJS0BC8WIOwjEwfwGHg4i42
         eN3d1zJ/5z884Iufogm4R+F1B8zkCD/Ipkobb08X2LLeq2Q5MinOlM18N/lNyYbTDwkd
         MeZg==
X-Forwarded-Encrypted: i=1; AJvYcCWHIkSGuVkKDR+7n6vndI0VlRvPKmvvcAw4joHyYR9eFfVReDQlxT3c4gKiK8Zis3X0obblPYU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy17YxqX9UWRswcCjOE6KFu/UzyWWk8dc8gz6tAbjF3gl4bW4jZ
	ezoZqM9ExrgfLO79pm84W8zgnLvdowcXDCYGWmgREH9IyT20lCI6pdOF1kf+eTVw/mZA+7x8EXJ
	OhZDMDBwH/vl2K3OL33WIMC4K3VA4aXUpwg3rbOJyzcyHoxdFqMB1/vT3jfNwEHO1
X-Gm-Gg: AY/fxX6C/wO2ZE+jKM6Lo95hoMrqpc3kxff/ZuDRi8hH9bgiDKFvRKT5XkieYhy3afR
	+RRGwbtrV8FUH0vWpeRcmXDqY9zugdW7SL4CGWR+J69oYIcpITwfVruJsShOLCADYbyvU14kN6h
	BtCD02z0LEkDaO6o7VGxzmPK2dCr5tgsfyACGmvJMsKziUIybOkuANyzEOC5fQhcVfWPY41PMxe
	yNQaiC/3PlV3juSQygXEB9t5Yww54mmMKgFAEwvH1QgPzU+Gec7HzaKidAzCkQOnpdV6Le0wjcR
	rpYusf8mgtyW5lGgi3hUhaDDjFGDvbVxIF+U14tjmxxTp6IR89/yNA2Xkz3Kt/oA5B+kcoheOCe
	Y+3Z+KozgTOiM+NfduKsjGA==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981421cf.70.1766569476162;
        Wed, 24 Dec 2025 01:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkNB3ACPi/FO+hv3JoHsZTBX5MuwuJtcjQ11szAJg+HHnPlCeIsNXx5g1+5A2cYrPCZrtUkA==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981161cf.70.1766569475653;
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm33694829f8f.38.2025.12.24.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Date: Wed, 24 Dec 2025 11:44:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Dale Whinham <daleyo@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for X1-based
 Surface Pro 11
Message-ID: <qptvyecgevfbknaepnyplv2543wojt2cgj26kdsaaytnt6r3rk@kko2bjurdbyp>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
 <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
X-Proofpoint-GUID: SM0Bz6BI_Iml6dbkWUSgwF25pp1RA57a
X-Proofpoint-ORIG-GUID: SM0Bz6BI_Iml6dbkWUSgwF25pp1RA57a
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bb605 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GlChVbD0Fj_pvowmbuwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfXwIz0y+gJitlY
 cRIJQqv13adfna12tpVNu8PjKwIEZnj/a/m/fWelYNWgaLGlNY64dMk3ccx72g7fmPJkhEiutGQ
 1Cww0blH3+Vd+HhKw7hkwOPzvX50DrY0zLNvwkTX5LXpNlZmRhrCmJbsCgPDZm4Hc9/R9Nkd2XB
 nkQSDRoWheHjz+NLGlaAvD4xNjEQ6xXZO0acwO8hOC9Xg+KKtqff+enimR25tEUdKcuXLcNP531
 YIX02P9Ouq/ZGxapoZaL9F/u9ApAOVZDS8FZbpvwT5EypcDU5YrmQlZ8oS+3ObXL5RwuOlno8kV
 c8Iz4bEC9WuZaOcjLT+y4mdXufn5GA6560MZ4ZiU7SRu87OJj9Mu6o4pOwkBO50RB4lrmW7aZs5
 bMjnnuGlCqvBX09ZggckIDvL5YZFE+j4vovOin9BfHcjNC0CQ2td9dN6RrtEFw469JklrzRHvcV
 J5PXQBJ5XdolExWCLMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_014438_533388_DAC8F19A 
X-CRM114-Status: GOOD (  12.77  )
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

On 25-12-20 16:26:32, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> Pro 11 machines (codenamed 'Denali').
> 
> This device is very similar to the Surface Laptop 7 ('Romulus').
> 
> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
> x1e and x1p-specific flavors of the device tree without too much code
> duplication.
> 
> Hardware support is similar to other X1 machines. The most notable
> missing features are:
> 
> - Touchscreen and pen
> - Cameras (and status LEDs)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

