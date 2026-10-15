Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FD2CCA462
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=; b=OcbSyYabOLUq3GdunHDwajDRXh
	X6FQlNRQbzOEtO31nsSQTwLevI9fKlA3zMH2nPdGOEvTzAZxpVKSZxKI0OS4gKj4F3jtXs/pDiAbv
	hA1h0iEf+3JMU6ZU/XW5o7bwdP+kq7CUr0UBPXOpKu0ACVg6DglTKMVamueXnDSc4uq8MCljSjFqO
	i5gTSdB+bKbnL79T1C8tfGqX2qCK2D9XwGbJgAehMHcgZU0fUMQ+kC6TGdPSMokziLTal+2xgJJFJ
	2RMkh+GSUlmqfr/7nrVr2Hwn/RhwBkKENPaXUR3mP+6rHYblhnRQyvdlJ5B2EWHDYpG/dsKaWwALO
	bw0BicOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTCX-00000001S1X-2nMj;
	Thu, 15 Oct 2026 21:41:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTCV-00000001S1B-1eBW
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 21:41:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFDQpl4126357
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 21:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=; b=W/StAFFSUlaMH/gX
	bWP5VXvrGrIROnXbTGVO+AR1RJ+1y2mROeuPGaW3Fv2a4Xg9e52C37hD10AGP5ZV
	l8L9csl+Vnocq3pep9ta5lTtWO+K9jla/+t7/Kef1QS/kS6/BUhxmvsjOwP+KEyE
	h0J6DW6yXFjbnlsB7no0uwMvXp8bGz+iuJ2k6HKCVBmANtY1V2M5h7ZR9Fk6nxAK
	aoGIq/DXlxFw/QFgh0YVZQypqTDbe+3RgbErz0HhSSyq6KQMHG59SzSPL4KLv6SW
	1NQtADzCZdgqWh7LdaiSoBh+p60HxB0d2vTSOCCJdZb3UJulSUKImnUjvOF0feyk
	HhA8kw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m1eja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 21:41:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso7050602c88.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792100481; x=1792705281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=Yjo1kn2DiJWhlDOmcAR/CLY4yX2hC65vhrvcXYTkeLFiy0vCcaVNMgKwq1sWrYHM7Y
         2x0SlRqyPny6YT4KU2WQsPfGvzk9bQykFpv+SmaXvP7eE3qNRHXpHhYIRKIrUs4Fd/WN
         JRdNiLUoX+cHhixEyBJGJXk3IHSNMmJb//9NA8KRcfxlITCu0Rm9qOY34qL6Y6PtaGh7
         gdigAbImFBgc4QMnAn+fkwro9zNMACOf33ZJNmp8wgg3v5Nsmcoeb9rFg5WtIygf8kMD
         C+663Q6K7nRqQvJivop4+nr5UDNH/mBgzmYlQkerWMyXvFkeWMBFSHn0wA6qhJyZU5Vk
         LY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100481; x=1792705281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a8omtOMUvQnoW/+es8xVBAFKUdGDbUKsFkbcORMiDo=;
        b=LWVHNRLO9MS1OlOIk1XSBn38gy9oqkRWRSyI2Mxz/MjCYeH4D0TLMABb2kXtka70Tv
         //ylVO1Rifud2G5mo2QqYSx2vUOgeTUXfybnJlH0aXNp9SI/x++KaRArbBQ8BzUEMbyd
         E1Lruaoj186kpvoB42cyPn4gn6GMVoJuwYSfY+rUiJljdDLkQuNRJWh/42oGWTs/3RcI
         b23wAFh2eQLjp6OF0OnBv4rtZtA7N8QvkBk+96Eun0ovxkV6kXmIoCVcpCNgTI/Idjkd
         KhCgZMjJCDKofqElw0lzfyoAzGsqCUXhLIVSbmQK6vd9OxP+n1n1H6+IpM+a++B+mDgo
         GttQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+1PqRm7R8Q/37HzskyN4eejBnqus3/xel7F69Q9gCueyu5O9hZXHqfibIb71geBPcZv34tgk=@lists.infradead.org
X-Gm-Message-State: AFq9FYK/8YF4Szds4KzwH+mlCzlHPlcn4WT6ulkkQO1btgTQIqoSBYCf
	90O8Zq9wrmT21W/hLfH511kSjOrlSDO7gIwVOgR1D+inYiHTbsQa8xCTJbMaX9aFiPEz0mq1guj
	6sYlasszg4xzXGDmV9kWmyJi22WTPjrmzhqgJn+cxFGoEry7WxOmFNzr8AaAqUg9G
X-Gm-Gg: AYBFou2bdNaNuQxpA8k/z/Ubnt/FsB9QV0Qiwi4ULAL0ipUKUWzO1n53j4F7oYygdDz
	5nMnGJQMa1+RLOCRyT/hk3k2J0/zLjf0x4dczRheXcV5L1cMv7XFX9qsexBemyZyHxcVoYGdapL
	CWttYfikz8JaBJ7ArsDajJVwXcCBFngFiEnizNZLL99zB1cCvTz1Qj9bjRHGwGvibzWARFUIeNA
	YXXv1VaAJUcSbjbUXMdGqVlnHH1MiDjoS7zU61rk3pOrFqjawSRzfkcg62/VwuRzhboSielQ4ln
	zJVxj3RwDO8mNemyaI9JZDlcn0CSzAbSqZrF1/nVqGeHgRgtNiF3Vz3/SlcbrLAWDPVi8kKsjSj
	XIuskQBQGp7w6+hXKv9YjZE6Xv5fW2hq5+rQGpEX7J0XPVrQ5bCI/5x0VVw==
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855970c88.2.1792100480677;
        Thu, 15 Oct 2026 14:41:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr25855932c88.2.1792100479947;
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm302156c88.18.2026.10.15.14.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:41:19 -0700 (PDT)
Message-ID: <8ed23bd7-f783-47c4-8a30-bfdf74e95015@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:41:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
To: Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
 <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McDsv0k0bD2LoaXfOh7uyFo=HRyO098H=N=QeMFDXsLKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad14881 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S4S59HBQktVEhwL6IfYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: T1tWvJduW6OtU4-1IMtzIwwXrwSroVqe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfX7u2+5obLyZhJ
 jUURxMe6uPU7FDFvBZna7nSsZ0JQTtdvtV1m3gvwlizPvEkZ7mS8lPlq+hzdN6a0LzVBkor9876
 R3HI0hxfgOo0jS2Fezx9elR7vGiHkbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4NiBTYWx0ZWRfX2p/9iC15XXLb
 +uZaFl2br4fFms6nrAzNmja4Z1vAsAlacl+2DHeLgEU72eBzrw5/nrLylrXQbTBTcUmUi/u2SDA
 Di8aJd02TFxfgHqaQtxFgJQnN3BO8omh938eNj34rphiQX6O9TK/rYfdxogpwbGYUagxHG/vrGt
 ie0tMVLUlfqLgNrr2dN+4fzXKmObCGXKWt9OMBu6gjsCvtlyUaC4NZbwJKQE2EorbYgZCpXvPUI
 siZrkbvpW10z2xGFUUhMCj1o+q55PIYX6tTFPixQ0NFoWBpU2ZVV4WU6YKw/X0Z5KLaXAf2fddM
 gEnnHNFx6WSBUZo8lMhXdp+bhEES2JitIqqVqz/zzO10n7l7ixlUeYuHog/S0zJy3MrMaGedVBt
 uGwJS3vH6iQ253HrRoRTgr5jfJ2YuF9q8pwpgkPuuZDcCJuajIIhJz9j99CHCzyRX7WPVCUJiKy
 SqBsoOMGw9CZwBfEUbg==
X-Proofpoint-GUID: T1tWvJduW6OtU4-1IMtzIwwXrwSroVqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_144123_568546_F5A2FB87 
X-CRM114-Status: UNSURE (   8.51  )
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

On 10/15/2026 6:22 AM, Bartosz Golaszewski wrote:
> On Wed, 14 Oct 2026 15:02:40 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
>> +static int efivar_nvmem_find_guid(const efi_char16_t *want, efi_guid_t *out)
>> +{
>> +	unsigned long max = 512; /* in UCS-2 chars; variable names are short */
>> +	efi_char16_t *name;
>> +	efi_guid_t vendor = {};
>> +	efi_status_t status;
>> +	int ret = -ENODEV;
>> +
>> +	name = kcalloc(max, sizeof(*name), GFP_KERNEL);
> 
> efi_char_16t *name __free(kfree) = kcalloc(...);

	= kzalloc_objs(*name, max); ??


