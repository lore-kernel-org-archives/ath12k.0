Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30BC982F1
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9Mke62+gaAnOt0SZy1qXuoQBKgzRrAMNO7a8M7rMLs=; b=IcZ4ViADs5+vHgTiUhr9mtkeIZ
	+KxsEUUoyQgo2tv3A8OMPgPPpuca3fPC0FrjLjG/NHvZ4ybRePnbI6CcO2C91OqG4jJm5mjhvn+zC
	7tDKIMV49rOwaPy40yKX9n7uvhOz4+svYk6xMVqt8dMj8/Wnjws9XUOPLDFsfJn3pnRs0XmOB7BvV
	QRXDcZ/Ivzle92EBBlZ+I/aw/5c/gJD2pwfc6yELR9Nuo5O1CRIS6ks1pogzU7DfD+wxGO83StgdG
	FA53zDwyHtR9S9M3OaAgGl3+YaaOXaVdvhWneKQOrUunfXgksyYNtbmC3Wd/+LK/bCDmJMfSap7Bj
	rcIdjPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xxW-000000055YT-0sUv;
	Tue, 22 Sep 2026 10:42:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xxU-000000055YG-3c4u
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 10:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X9Mke62+gaAnOt0SZy1qXuoQBKgzRrAMNO7a8M7rMLs=; b=ekIT+19W39J7PGzh/phJVKJ85y
	qSuih5R8ZyI9EvIM80zmwX7ByOzVOwbnaz01u1oLarooAtj0qiSUUBix9oHAn3pgnAL5hF9WWBg2Y
	nGIZ8ak7jTleSzE7NGEMoRSKvtBB40hLDJsA61Ik3Y3kpLmf6DqfFniPFJvP9FM58Orus4OEl05t7
	xhdnKL9V3XniqklXkrzK2pDX79PJsDJdilHAhLxFpkYQjLenS0GB74kGkLnVEB1OSQj6BWzakD5Fq
	XvsmtErGYtT6MOqcn6UCiMbo3MCBBaadG21NUsMw4XZtK8A/17pJzwU07zC/Q+y0VQrTSMVxb78g7
	jLqWhrwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xxR-0000000DSFv-2nTV
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 10:42:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA368P801500
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9Mke62+gaAnOt0SZy1qXuoQBKgzRrAMNO7a8M7rMLs=; b=FQDr+lzhfNpZk/q9
	ZVHr/LP2clap2Y5VnRWLzBCIbUXVq5s7cMc90rjTmTIuQ4EMfmk+9BX58jAjo5ar
	hqv4SV125rT/Dr009SqAt88QKAtufcsV7VI2v8ig7PBc8d75SLgacn5bbQ8eAbnw
	Acfw9BJwaD2//TAoX8JUe0hYzz0zT3WK0phPYAhH1O8YUwZKBcLhERWRvK0p4NNS
	rY4YElTu0rb6N77JP5nZj4ugrIZDJws3DQqyh77OYRDomraMsyrlPR1ZZhsL3KlT
	8H8YtBVV1QOmVTs47ndW1D2pU9IvXWLZXh/XsPZM41XTTAsmOhD9gE2e05rbKJF4
	heMUDg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r509-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:42:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc51591102fso5647497a12.1
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073756; x=1790678556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9Mke62+gaAnOt0SZy1qXuoQBKgzRrAMNO7a8M7rMLs=;
        b=IF27B70xdjd7w6s64/QK9ECq1sDvX3vRxjNr1Marv27DzoLcZg6RcKEcLv7tNHBfHI
         Hnh7kI4DSEDbxPG/p4w6buiSic0pqufo4Xv6w4ghWNm2PhDArCzHoRM2VsdBItPNqvzl
         j74JqkNCPDVzuNB39009mmee0d7VfL+0/5e3mu4+TuW9a23w/kbIxjo1rhQ4Vg3VoG/b
         /Xb1bxyAHHmMSrb2HsG8fpf39HKCZUOpGGiMqrkeA5bH4f9Lo4TXpXosrsW+ew5tMriI
         S49pHVpsRYPfT7CeYPdCSVdnDVuqy6wKmWQtQY/LM+mvmsZvsof60LLz2v9nR4JsdmTM
         yW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073756; x=1790678556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9Mke62+gaAnOt0SZy1qXuoQBKgzRrAMNO7a8M7rMLs=;
        b=EARsnVu97mFchrczMiWMDr0gnLt75xoa1P1rhWpizIy60NzzEkhj5fSoyHgD5LZwaN
         Xm7HHkHm99vUxj9hiOh+ReOuxZdHN6C2jh5EpYOb50YuzvFdpvfwYVmS4DXSwbq1HF9S
         2Di/iIwWKqsKBNhR8I1LOAzNd+VMkYKO14NMzGWork904YSIojO/gJVUmE9RpA9zGyDp
         WubDd+/CCPb9telL8qQw5VScvDDjDzflK62DCvc9i9t+J56kPC999/zeHQWs5Ar+jbbd
         bqOLB5dundzH0KxqWtBIDMEIXIm6o9HEs7BHK76Dqkwz6PxM7PlYvcdQYrjRfViTsMN8
         GP/A==
X-Forwarded-Encrypted: i=1; AKwUvBycCHAsviYhJnxl2BvL6KNxCXJloF42dPdsvZ3qDWxlMFitfPXRBFao5xn3kyzlAniyrVy6umc=@lists.infradead.org
X-Gm-Message-State: AFuF++m2SfqikbVBxAvidSHaTA3fm/XDQATNsslxuvM4FtXb3d+uJPHK
	d0tsNhAtjY6svEnHnPF3mNv/Y/DgDcVA7pTSeGOCHSZzn93WmN82kDIb4h5+Cyyt7q/WXhkxi/e
	bl3fMM59T66CtoBpOm/RdSXaRBT3w4ukvGlCEQjvwtl+6+Kl6ujG+GEbuO3atHMBEBVkQLai5
X-Gm-Gg: AYBFou3XQlVY1oU7UCr2IVWDWGq55FeGLLXW98i8T66zYe5vJdQrkZllia/X5PCMOBl
	Z6eVMaqtBx5ni/M1jVaqu9o+8u3ubaElcSu3CF8b6TI3fkvV5F2sgLFWU3zt+tN5a5NxZxIsT6g
	Qa4qoSXrHY6E4iKxfZOVEd+lbuamSNeHmDUyzCrONJaXGKo8fzKUq0+sNDdKpow+6a25AIC4H1d
	g4NXGe3WTJ+Kim0qq1JacaDzl6XideFmwtW0ssqkoEU7HBcGyjSOsb4NiYuajcvocjpfh0CwZvH
	WC6ZpPZX4vpZ4sqijlj6ONzBUknU1XYJCVy4LihVrVgsZlirPITnxX+Is9qAvNodQmQmnC6FVFP
	lXKC775lSzwFq6OTJKmOTpyL1XcXQtzTl9g==
X-Received: by 2002:a05:6a21:b82:b0:3dd:a196:9077 with SMTP id adf61e73a8af0-3ddec87d604mr977530637.65.1790073756264;
        Tue, 22 Sep 2026 03:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:b82:b0:3dd:a196:9077 with SMTP id adf61e73a8af0-3ddec87d604mr977486637.65.1790073755768;
        Tue, 22 Sep 2026 03:42:35 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271041sm4824734eec.10.2026.09.22.03.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:42:35 -0700 (PDT)
Message-ID: <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:12:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
 <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfXx4M4kugVkyvo
 tgxXtsn3hoVD9Ffj5hy/REfpSG+LK7x42H1CFk0CmrFqRcPXcH7Dz4pfKUmzcoXTZBQSE4/UKv/
 UGmZFPomC9pN6fl5tbdrhQnargPXOOdJyN6SzX1vEPk3NZxO/wRYli7rd6Ip3VrtBt+jDlqXIiX
 ILITzOZ+LaFlCMbhA6xt1LJDbLs9k91GLQRyHpbNI8HACkZj6ahToWgrBkopimB1cxeU2Ylq7jP
 v7H12Y696YalVTG0dEAhg4q75kftghsvkFjbcbeqwxU5A8AcK3kzJhChwL+EeUdu0I2I/fVpxY6
 B5SReR0hLyX4mafpvYs/uRKsY+1ezeDvqDIsfr4xFttjD60C6ahSBTQl7pux1UASmlHbD1y3puN
 4WAUrfa3qeMcodbtsstP2e0BuB0BPZDux44zY2cySd+thYAcE+vtqvHjG9ATUe/6NEekV48GfNl
 ce+8RK9gAIDuuyFEU1w==
X-Proofpoint-GUID: pZNN9c3bByS6E3IvWAquTB2TKFiFfi9e
X-Proofpoint-ORIG-GUID: pZNN9c3bByS6E3IvWAquTB2TKFiFfi9e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX6CVVvS16Uvlm
 Z8I2ZQlR/+l9ZjynZGe4vKxTeFSTOudtGDQy8+Ox3ffX/OcfU6LijHg1/gYD5rjReOp5MhPOrLp
 CnwnYxYevoPE2JegPPC9GhuztWl1ax8=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab25b9d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9xC9gAlW16PiWnXnPz4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_114242_164432_3503DE21 
X-CRM114-Status: GOOD (  19.68  )
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



On 9/21/2026 5:21 PM, Johannes Berg wrote:
> On Tue, 2026-09-15 at 10:59 +0530, Aaradhana Sahu wrote:
>> AP_VLAN interfaces do not maintain independent BSS configuration.
>> When station information is reported for a 4-address station, BSS
>> parameters are read from the AP_VLAN interface, causing beacon interval,
>> DTIM period and BSS capability flags to be reported incorrectly.
>>
>> Read the BSS configuration from the parent AP when populating station
>> information for AP_VLAN interfaces. This ensures that beacon interval,
>> DTIM period, CTS protection, short preamble and short slot time reflect
>> the parent AP configuration for both legacy and MLO station dumps.
>>
>> For MLO, the per-link BSS configuration is used so that CTS protection,
>> short preamble and short slot time reflect the configuration of the
>> corresponding parent AP link.
>>
>> Only advertise NL80211_STA_INFO_BSS_PARAM when a valid BSS
>> configuration is available. This avoids reporting zero-valued BSS
>> parameters when corresponding BSS configuration is unavailable.
> 
> So ... I guess I can't disagree with that - but is it worth reporting
> any of these parameters at all? They're entirely under control of
> hostapd, so it already _knows_ - is there a separate tool that really
> needs to get them via the station info?
> 
> I'd be tempted to just _remove_ these on the AP side rather than making
> the code more complex to report them correctly, in particular since
> basically nobody could actually be using them right now since they're
> just broken ...
> 
> johannes

Since all these parameters (beacon interval, DTIM period, CTS protection,
short preamble, and short slot time) are already populated in sta_info and
are visible through the iw station dump command, I only made changes for the
AP_VLAN case, where these values are currently reported incorrectly.

I am not sure whether any third-party userspace application relies on these values
apart from iw. If we remove these parameters from the AP-side station information,
the iw station dump output will also change. Would that be acceptable?

