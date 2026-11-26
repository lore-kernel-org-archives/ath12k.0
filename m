Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A03606A31C
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWmE4jw4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKMreOhp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FXJRXyeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=; b=pWmE4jw4w4w6/K
	DgyRp4HZ25+P0FT2fk4BO4Hp8Xz9KcdShnoLPsBIfEozHcZLxOLfuURT5GEDUW4x04xU8UTMCMlDV
	vnheyAvPaUM2Kd+YzKDSOp3CXsBTNjghC2NFbqdL4bIzm2G2BAzHPBmaXQKZWsR2vV/Zn7v3xf5RA
	EwDjtye5nRNiXmAGR8XQotrO+ziexVMq9auHfbNtnU6b7d7iAFXNq1cmhIIGWNroLWAswNq8uId49
	vnb502Johu8flTXOsn8liHnkDOHGY+My8tDJAmuDzvo02rX7aW6Lq3sqS0Gzht12E3ULy30g8gMCj
	ugMsz5xv8T9cHOrHlOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd7x-0000000E2Dm-15ch;
	Thu, 26 Nov 2026 17:19:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd7v-0000000E2Cx-1YGW
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 17:19:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9Wa275270
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 17:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=; b=BKMreOhpo5J6OZNA
	DmwzO0JZ8RxRW/8sMUNzqxURtPM29bCZjP03Fm4+0T5cK181ysFoW3aJIVs8zX/C
	K1Q8iq6LBGc64O+OBy3AWPc+hG/Z28XCLgwpy38mE6eBSYwCsBwwbd3u8m1Bt0+a
	EEACRpBb4TfV/gEA+qSb4aRmk63lp/0YBoYSUh3x4W8MpqGnI5uJrECR0PMLH/9D
	H3vDDSqTD/YTk3sawNapRXvKkqd34y/Z3yusQpwz1Wq7Sx/1M2xfnZ57dnz8wHLr
	aGLaQ2cdacezlCzTghJjZO4RZML6YLapPpBZ7U9+me0zXVHWxvibKci3DByEpVrs
	O4phlA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81txt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 17:19:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2796329c88.0
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795713557; x=1796318357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=;
        b=FXJRXyeDBwxCZRDlEW/cbnoSwaeLajfPqoEBmUNHbuEeqSjEZoO534JuKo78cbmDJU
         /CcwR6dW5gZh/Pza9H1qrVNbKSLhRzEO1PwZN+j2eEs1f0taRxdXyYv1bhv9QEd+AuaB
         Tebtxcf//2YYTvdh97XcvbxZhZoZjZiUzCvAsjpvvzcl+FxgSIvC1tWMuSa7yQnQTwzf
         ndasi1cuK5wK97xxeWPAzPrtFBAsRM8faHsH6p4OVjnlSizsCRxUZ8zErEv7ipq638Cz
         OVTmXTm3jKq6xZRLqUcz9UF4HR2vkybgUuN6d8peAiFxrOaIev00inoaAF6KgEbGrBe7
         RffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713557; x=1796318357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=;
        b=0+AyYq3PiUW9AXlUWxHczQrdRrHzE9fQOHq4AJgrODdYWxgGJ+h3fccmrPGlI2OnE4
         NtZU5ddn8OnARZ2oUcuP9Afxi49Kat/rCuS7yw1MrK7IrCwhjvogDvJB+fdQA4OyvSaV
         p7u1o/a4ivHSIRL2w+F6l2IgIIk4DrWF8EXUx0r4mD4koWE2XPRwpXLuXRAyPG1i9Zpe
         VQohPQO6J+Z4N/i5rBkMlx1F1titDp1b8Awqx4T8FM0nDCG5xWLCKxE4HJiaJl35+Sl8
         ZpkUffbF/x9CkEUTudHs1INe2XNgt/gUN125obO8f+X5H9csYCsI4SlljmyocLVaqAor
         fWyA==
X-Forwarded-Encrypted: i=1; AL+hErF4fOeTfvdVlvGyerZxmx6sKByilCT0a8xvUCKYfUwgawRLWPzxq8mQWvCLngnxXBdN1WT5WCo=@lists.infradead.org
X-Gm-Message-State: APuU4Z+e9lvGdPmcmYwH0Sk7bnzr2m4Up7NfxzzlHc8s9cnqudGlYJZp
	BG2qUqQdtw5tGKJqp5wxxFKhWNaCgALswmvidVfb36QyRmKV2e+Uy0iCt1J3BslNWqZiGVfVg3U
	ANiq6GSdtU2g+/kmHTdp0xLZXxSlSZgGxxtQuz5ZeTXQVsul6OGOcqw6fnZPcwHvw
X-Gm-Gg: AZFdTZcXdNfdcqC1bvxcNFG8sppx6baxb3NlfVUTcuzv1aysY2UZIiTGp3osQXgsvq9
	34rkB8+HK9lJb23v9eZAagQm0D6lefUjH3rmHEz1oeV22bZGDim1LkKmap+WlM8viQ8ac+BKL2+
	6fPKKFIeKcwDO1QzJbGf0SET8v6KTsFL4k/4IGJjhMhIVg8O+T6p8kmnnDb4+iionHAaaE6dwT3
	G6QQ9GniMGRbp+2EJRNb93WoWVeJTsmr3EZ2zEIeol9flPmU2DgwpRipab1XL4Mb3oqJgrqdBRo
	c1mfxdXRGGPoYZo4vdyvLAecFKvocXhrf8sjwNLPgKnZLkgSI6r1yC9VN9tTFCePC1u5Wk369qc
	H4l+8kipcTrAcMyd/LiarHkB5OyLkQSSu/cG69x9cDwYD1+seHIHyNGzsmy8yYt+E1OuPiLLxOu
	UwDc4n2CC5NMTMsYETOg==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26336565c88.30.1795713557273;
        Thu, 26 Nov 2026 09:19:17 -0800 (PST)
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26336527c88.30.1795713556648;
        Thu, 26 Nov 2026 09:19:16 -0800 (PST)
Received: from [192.168.0.3] ([49.204.130.51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm57578044c88.6.2026.11.26.09.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:19:16 -0800 (PST)
Message-ID: <d529d96d-ad34-4768-9135-f3909f9e6476@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 22:49:11 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix DP used for WBM error
 buffer refill
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-v1-1-21eff2270080@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-v1-1-21eff2270080@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1oqdsrwEn0JVApNwnDUkiphVYpNBjl1X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NyBTYWx0ZWRfX6iFP5VZ6Dz4Z
 tLhgWqscH78vB4eeqoZEfdciolFY/cUmTLI+Plu8svW7mhJ89iIXTMXhhkteuuIXET4v0zS4Xme
 xrRdm431Aw0/Z4qzo2JP5A5dBCtPH/w=
X-Proofpoint-GUID: 1oqdsrwEn0JVApNwnDUkiphVYpNBjl1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NyBTYWx0ZWRfX+qhPI9OIxtHD
 tB80PCq7YQhToK6QmzHuIva54xNr74+T5Jq1F0CxK/URAFt8C9a9oJEMD9VwtykBGzc7Dt0Nj52
 91seoshHvfQP8ca48LNC47Z4aZTLRwUM7/jobPiz3hYo9YlB6vFRH5FDytd4LUCK6wa595ukhwY
 RIoI5ezd5DyQF0pY9c+nKj3eYxotysQ/PVNembZLwaXMbhCIld1m8AM+gJepa4RDPtQm+/8BYfm
 a2kPBpenb8BIDo2DnWYrCoSNENyD0gInX7hAZrEhVCP2QVaywGjkqrXuWvNO754qeSIfzjNcTeE
 JkIKIg6vhKN9wpGO7NlxPLs8C7a7twubpaFdMoYx/dq7Tu1mXLYRhmH20VJCdPbrh/tkxl5VrS5
 aYqHVSAEgEYdvQCLB13J/Etv+EFQFsqfzo5PJRVWT2AYOKCoy5DdlUZ9glS7jiJgf9E5e6NHAGz
 QMl0/D46+DDLqbZBxvA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b086a16 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JcMdxy0ByqZMvlM8ZepLMg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BMu-IVq0bH7Oa2EsFFQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_091919_534875_8F1792BD 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17-10-2026 15:06, Lorenzo Bianconi wrote:
> ath12k_wifi7_dp_rx_process_wbm_err() replenishes RX buffers belonging to a
> partner device, but passes the current device's DP object while using the
> partner device's refill ring. This can map replacement buffers with the
> wrong DMA device and access the wrong RX descriptor state in multi-device
> setups. Use the partner device's DP object consistently when replenishing
> its RX buffers.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1d18b197bc4b ("wifi: ath12k: add partner device buffer support in receive data path")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


