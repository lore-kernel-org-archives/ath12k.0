Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540BFC43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4mqX/qPgDfcNPuQAehIBrVbcs3SjlIok8zx5e9pV4A=; b=4YViBSsJhJRbYg5H5LYSYM80fE
	jTvQjTHEVO+SRx3P1jjT0oprYj1727rQlFMGKJ9IlrMHa34QK818gsnrH4c9djoLnTWhoonIJUuJy
	u4YAnO6mmdT2+EzKPUcoRqvx+319lrwgmmCsbY5aNVAo4FPNQgz3oAGhPGDnxuhNOsdq7iqdCAIcE
	+6tSC3lk4J/tXYLYEuhvaQpbce/Q6baJP9avWZ8DoEUB0X37Clc+jaganHLYvDE8uFL9fqVKmiUfC
	yESiVacrgmFK33unqBlYEA7VXNkBYcXQcbU7x6s9peo6rSV2mfb2ZmNEDuP4cE41BC1As07WLYEh9
	ZrkK1qlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVBX-0000000GXij-0HwT;
	Tue, 30 Jun 2026 09:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVBV-0000000GXiK-3gxt
	for ath12k@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I4mqX/qPgDfcNPuQAehIBrVbcs3SjlIok8zx5e9pV4A=; b=keziJ2FE4wBtKv4FXdqBVDRTui
	Zl2CwKLrDNzqkhUm3Z8ioxsAquwiP3HBlBnNPlmf5bSmXNtmQdPzPPGwGkvlqeny04Kta+p3s32RM
	m21ED9SV/VnKW0UTnmjgNqbsi62V5nzCRAObTf1prqqVOgcMsYns9zCsxSN3uPOpVawZpuC0/LAiI
	oZm564opXxwmj0/W7H1ZAmP6792DycJ+MbXBuXM2HSiax50enAyneDtgdYYapeIQ80zw1wKmJRP72
	JQZjQmom3Ne4Y5fpHN5fTnhHpkcDL7Z+xtjEF4SKpCnNfDnjMXjk2yo5ScNojNfyi2hcH8zccnROf
	LETnmAhA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weVBF-00000001k6O-33a0
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 09:55:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mwaT1604649
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4mqX/qPgDfcNPuQAehIBrVbcs3SjlIok8zx5e9pV4A=; b=YwyMC1ZmYoTG3rm4
	a4mVHjE/jp6wkHh3Wsih5lo58TJXc1JmrF0eJRXOX1AdOuXCG56ETBSayr0BdnaO
	PEkZJpVkRvLZWRO6xYEpYTCKjiOOvJ6JeTcIuPCCqXgHnVygfuWyA68ac/ifXTck
	GjowJSfjUmmVfCmf1JB7g2WSxLeibM8A4RRpE/cavngzQA7NT263IiBh8hxo1GkW
	R+s4flvvFRLgGIuHYL1wiVi8mULtMtQpv8omiB99+P/rAGhf/1KmTXFUo8wZs5B2
	u0QS4h19ASNi/NLJs7t5EDbundKdpo5I4Vrqud8xM+oD3+VilHut8UL0wRoEqpcW
	Pj4Ocg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhhwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:54:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479586724eso1241664b3a.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782813296; x=1783418096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4mqX/qPgDfcNPuQAehIBrVbcs3SjlIok8zx5e9pV4A=;
        b=NbVVp7E4tZUaI5EJv7PbODjBcSsAmmik6sw3YrptLcBaRdf8nfe9ZArPJk0myP4XAt
         Nt/eygIIAukcSDCHfw9mWtfxczbFT974oB6g85vOeQJZ0TMCHST2joO7RNex/aJdXlPf
         LX7kmzApIgYcXdiEeJ2P3JpA2ixhE2zRfkBOHMlmBlYyxvrX0wJc9DCKaEbtTHk0Q9NG
         amRekgRyErDVTPp5encylPoo2tGsBoe/8HmL0oTVEkM+mj0Z069ojIF70GrPATCeqao2
         Ycxx9unq4wnooTZTMnuHLgkS6otoXjq/sMhwsNOEa/2NZYxX/ktYGS9slIl8eifxuZCs
         lvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813296; x=1783418096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4mqX/qPgDfcNPuQAehIBrVbcs3SjlIok8zx5e9pV4A=;
        b=rJSMG3fLa19We/qBuV/elwrFxcVmbYYn2G74dcC0+l3JyuLrcq5UNHecpaVvBRtyDB
         /biCCZQzfGMkTU5KgkRz1X8OnbVvfw5SZ2iUhAEKCDx2MWfT0ENU1vqqwsfQ4dxTDXV0
         WOiCnET6tNW645k/y+Jvlmq4MwqXwJPMs94vnKJWJaU4hHpwXwIIyi7FH2b40J2vFSvX
         2uMcIneX8Q/0hPgteD1V9yyvEKeCTwAFK41KRrIQ5TY7UDpfBveF4X8Lpnj12Gur7J83
         9qUmXj6mguCBzQ5QeYRE7voMQeydtWXLkotmpLGueqGI70FiPuxMSjxTqbX2FopnrlPg
         rJZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6emuMfzoh2jyDTe3bLWo7BMoy9P1cCifstZM5mVK6yXcLX+3C4cQH+0ny2OXGGzWTm7UZW8M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze76XekPHKsSU4cCF0o0M/U7RSahrGP2zr2JL4bzGyUeK+JbZU
	dX50j4+TeAsaMsnHqqrJOvDPdviT1XvFARieEuCEwAEwaIx9/xFTfyHQeAZ2Bc8GhES6PNF5ZOT
	plVql91OAxtDQ9nMm36S0LZxWr17Au9726tJA4pE7M7j3XP4Phxa2sauB+gNFLkK0
X-Gm-Gg: AfdE7cmlqDN+w1CqOCGXmUiTiMbFV9pcWhf1QJyN5auX3N+wkw3I2YotNwaiyxkSCrP
	H6ApNkios+xdGkbYTfFStN4X6jDl2rqmyqSZcnS0Rut7rnJhd282mHWPgMK9phe/zwHy9Xeyv8H
	EYci0P54htxlODUoGQeIR2q9T4FbfWvyRwpp4nGHTdwjQ0KEMeCIcH214L6dS90tPWjROBu3qJa
	A6b1x+HGCE1i1josOo/1SJiKA+Rwh134qe9cuGD6NyhkAg/aHTV5DMb3z5cdkb0clP/aGdzg7LH
	m1sBNlP70WwsMhiP9GixPcdfO4wQZI1yIuCPqfW9T2KoyXClRGmiK19+MR7AvTa2MRenUoUttHl
	wr0EgUNRUu6nKTqGaIj3TcIAIn65HaJHhQRSZKQo=
X-Received: by 2002:a05:6a00:c87:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-8479f0fb4f7mr2380845b3a.16.1782813295560;
        Tue, 30 Jun 2026 02:54:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:c87:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-8479f0fb4f7mr2380832b3a.16.1782813295136;
        Tue, 30 Jun 2026 02:54:55 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a033b21esm1545220b3a.48.2026.06.30.02.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:54:54 -0700 (PDT)
Message-ID: <e6f33487-28df-438c-8af1-73207d0ec23d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4OSBTYWx0ZWRfX+5/dQj0mfVo4
 GnU8YhrQ3xnonLRhgf/NRIKhiUpUtSlGun7CsnqfQ+ZLb1ZM+u2bAzd8XPgFJqhJhixBr8fUcPF
 3XynmmcS8Wc+9+Bar4JEmjSf/EYWKuD1+nvFu1xVCsOQKg49DgcN03pG+NZac1nMT3DUm24VHVA
 fIfWDK/WhZYP4S7U1uUyNrKBjtAPvyL9wwY0J662Vwd3u1auCVJGYjBRztR2vuozJPq9EWW2/Fo
 3GCIOTeoywExm6qB00i6FQUWCzA+RulIYWJDZz4oSBsahCliw6xhIwc9ndNFjFL5xohNY8ygYdD
 e34vEgU8VTDd/icu+wXkSuYFGQa3biacX9rhO75eUHFkmdb61YgAapaDgxEsERUIsZqslYTLfcv
 i8+OiM8bsWI5bBGogxhx5UOjb86NKLgn7w87QHb9fQCD9xKkdgz8loDex8ZNDmASEEzzr6bslmX
 ZX9QtW1ajTMoYUh2Yig==
X-Proofpoint-ORIG-GUID: 3IV-k6X6zKF7U6zCJvcQ3CQUERTTxbli
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a439270 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-GUID: 3IV-k6X6zKF7U6zCJvcQ3CQUERTTxbli
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4OSBTYWx0ZWRfX7Eh2t3F76hv1
 jPsCbKOj9tKCKOsvz5XrZFzj8rIK9ZyZJ9KAFk8GylDmpT5sX7COicwGXQka0Mn+c/Gx9f4SJ5t
 kskyAYBseQ9WGJaG3/wMk/il/oyMMzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_105512_865984_4A8E07F5 
X-CRM114-Status: GOOD (  13.35  )
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

On 23-06-2026 19:46, Manivannan Sadhasivam wrote:
> ath12k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Alex Williamson<alex@shazbot.org>
> Closes:https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

