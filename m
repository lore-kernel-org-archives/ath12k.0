Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F24606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUW/xaQG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpyYuB/I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZ9qLDW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=; b=XUW/xaQGfmrD7+
	hMiZYG0K1DYSE6ck7DaUafFLmiF9kbbDWjvyr4vbAYeTwc27L9ZW7K2LaseZDXSBMHsryqPBc5Jyo
	bbGg398OZ6nyg8/G4fffkASH3s1yNumOFveCaiRaDYy/2WR7BBFd+UpEfpWy8+73dxn9svdpBzNpK
	GS3ujTtCPqTohWe2QfGxbtnSGnwSmny9uJ+T313PegWDiOxMJ++4bx+Z78Yptzxb9kldLyBAoT43E
	0KvlcvCVxjBaKUhknJTUwuFW6ZP1EpRi/B9Pfrtl5DLwEAJ8D9Ar4RPdR+N7YPa/Wyixgr12lWHCM
	G4hWwJNyFK1GFp+antIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0tk-00000009kio-0IT6;
	Thu, 05 Nov 2026 17:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0te-00000009kh6-0MAA
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 17:05:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQVSQ1657304
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 17:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=; b=dpyYuB/IwZdMjvCJ
	bcWfhr/MRUmjY8yU2kYoWhVoVOSH1IgN5Q/irDeC0zoljT0WO/INopqYXbM10omS
	iz8xkDDw3Kx/q2BPp6aWcYi6lH7V/mBlGZKlihHc8l0QKF00ZOzQPSp2A/Tt1TPF
	vSd4bgwny4JfDEvWl4TVzSM8CXQ/9XJ/RBgMI+rw/FGxFChPaxtDO+/rMBj4JqpS
	FbItxWcKF3vxHqG48iu1lJTzdKqrWowiGeZSJKm5bHPw0nYp4BmAY7QA04BmDlt3
	P1eEQselIm8bSgKAxWiXNjVxQne3AG+6LumV3tYHV2y07kRYWm6oHcsoHbOKn4y7
	0V9jZw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9wkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 17:05:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3978082eec.1
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 09:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793898303; x=1794503103; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=;
        b=DZ9qLDW98LOtNfY+Gbz728iuSlIJhV7DCSwaf6lBvX0APN0MTwtD4OVaU5pVZklMJG
         hJf9nufduR2/ocJZ9E4tZhYhieH/H6q5AjNw2YfUoaQWW2SzJXMLSyT9JkAekhjTQVGY
         E9njLT2D2+WZ3BHyFHXwG1Rp2FCc2EhccVinS6BMf7faZOLaJpL/DXNlC3Nypw7YAHpY
         hPgFXMxPCuCvTS0cRa0lkyGAxA3HSroLBnekSZfZvUvSt40sLSRs/F+eApqNw6hjaikf
         MAEluMlyNxEzOZ3V+k/Gay9ZSp7/28TxESI+7RIJeQK4ystuUKGPESzm0YSD16D7s7sV
         gWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898303; x=1794503103;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=;
        b=nFaq4ozx/fSvwR3YjMKiCQxc6C7l1E3FMXm44Wu2Xi7WmzLdfGsgf9FnMcHFiEQ5ZA
         6FIS/7tiBXLkkk+Vy+qV4P7Bwgn9DGDSHobFVqsXlgOhATlIfTfIdMQ84f9fbcZX6Nh8
         PrznVbuKt92buI6Z6QHF1TgticF7MqludLsI8N19i9UnCgJcQFXbcs1L8aipQ2u56emq
         osb2wDvmWtOyBW7egWiz6qaOP0tSij3X2j4Niutl6PoDzCXWjue/K5gteD7ZcZRAaCfk
         /vZckH1RSKYNzXTBJKiYRP+LVF8s2QoDKRW1gt6Cz7Eu1ET9aqtFPNi6XDVQtdeXcdEU
         8RBA==
X-Forwarded-Encrypted: i=1; AKwUvBxQU1KwOA2kygAGwUamsqkiuzHWmGuyMWmA0rmIbh786CTQ3csxZwe5YFA+7gbFxdJLDHazSMI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9cW4NFWJNJpCrwcg5NZiwIsoFylvkkiY4rPUD5PA6wWG3IIiKn
	MSBWvpRiPlnqcddEA7nu5kX7p9c8LJ3vXcmGj0vSQLGN7JFgdHW/ixbxdAtNyYS2Tf4rm3/Dg1u
	fVJgy/xC72DnkYGwW1bCR3jSciylGitjC2CNy1LZodzA7txK0t1tgeF1SZ0nDihPr
X-Gm-Gg: AYBFou34VCKaJGB4yaDnyXoRdZXyDJ5OafHEkh+k4IeZ5SH6q+VG5HmM4NHaEmfJ0Nu
	Il634ey/iKb5IfvuMIPNsYaDYq3S8Cy09C3k4zqHsuJG5gnQthNZgROpkkSYX5hlU15CqAfO64I
	I9FF9i1bGUKigUVB6XMDRDQSRIehdglkSIIqrmNamQRx7wY4WXUbj2ew5IDHBPalijicscdEUDq
	ItdcbnO+Oy5kQxkoWNA9z/L2zKtBmPdGMj3VO7y9FfE1xHwPOhCfYPNolkjSDA0S/5rSDTnhh1p
	Y8id/UN6wGdteDPl9TlnfY4KPN9ZjDX4WDV7hTWBarnkyrK39/2X+4+r7vTYvedGZGjd/wEHbVM
	BrSrF1/nkiwBpssPbNqu6TvBsNiYMbgfjxRseeMyB0bje7xJGUKNTramILVO+LhBnbTg5+iJBDH
	fZ2ec1kTMp4Eavtts=
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr28881553c88.28.1793898301058;
        Thu, 05 Nov 2026 09:05:01 -0800 (PST)
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr28881520c88.28.1793898300422;
        Thu, 05 Nov 2026 09:05:00 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm18717397c88.1.2026.11.05.09.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:04:59 -0800 (PST)
Message-ID: <b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 22:34:53 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath11k: don't bit-reverse the
 firmware's PPE thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, Kalle Valo <kvalo@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        ath12k@lists.infradead.org
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
 <20261104-ath-ppe-thresholds-bit-order-v1-1-0f569106cbc4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-1-0f569106cbc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX5ak5YwgFe9P6
 yNArExoPMOOpd7DXlIxq2Uxt+2KW7lgE3XV5UqK+COe0sAmpIl+nd17pYxiLe8KyAKcjecSuGzy
 xv87pcVFbSK4U3eU5/aCD1qK7jqypK9c2kY53Z+M/fUHjiCj30Rvo2YhnYCP27RLy/PxRqQZuvl
 Ao25IRaYOlsmy5Ghm+2brRqZX8PkvhDYNv50DzKPAJgfMLZ+aEJfLyTL8WX37ytUhEevQVNEY7x
 3i2VE5V24i4EO11DALUoHGJcwwLeR0eKEofx1CvXK89fwPhLcnBzBGrzdYj9C7Maxcf8locEEw/
 mVkhWxw0HeMB8rmoQ3yA5BKScJsRN0HND0aYm35iRnBLYvnVwonmf5tQQxotv4BRDaqEOW76aL1
 oEg5d2ntB7hfc0YR03MdOEo3dYtGFdBGUh+h5ABUOzt/t7ej14Ae3hEo/KHKK9Zz6Cav82W/1Uf
 uzWOLo9WpJD0PJfK8cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX8UQhpnkWrpin
 YBemAG72LE873Qwo3UEDxs52zYvvVv9lGT29gfeC73Sz0esqo5hzJJeBHlJLNY+n1DzG0PgbCCH
 hPnMyYnGgIh/K6pN1X91hoGEg1HAcUQ=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aecb740 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=g6HBiduwhlTomHawZCYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LgNMDwE5Ast4HjQRNyjKWv0s1OrZgRaN
X-Proofpoint-GUID: LgNMDwE5Ast4HjQRNyjKWv0s1OrZgRaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090506_239901_75980068 
X-CRM114-Status: GOOD (  22.69  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:47 AM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> The firmware reports its PPE thresholds as WMI defines them: in
> ppet16_ppet8_ru3_ru0[nss], each RU has six bits, PPET16 in bits 2:0 and
> PPET8 in bits 5:3, each a 3-bit constellation index. The PPE Thresholds
> field of the HE Capabilities element carries the same two subfields in
> the same order, bit 0 first, and ath11k_peer_assoc_h_he() already

yes, but ath11k_peer_assoc_h_he() logic seems to be too complicated as 
well with << 5 and >> 1 for each iteration. Looks we need to simplify 
that with just,

val |= ((he_cap->ppe_thres[bit / 8] >> (bit % 8)) & 0x1) << i;

May be in a separate patch.


> converts a peer's field to the WMI layout that way.
> 
> ath11k_gen_ppe_thresh(), which builds our own field from the firmware's,
> swaps the two halves and then writes the six bits from the top down.
> That puts PPET16 first again, but with its three bits reversed, and the
> same for PPET8: a threshold of 1 (QPSK) is advertised as 4 (256-QAM),
> 4 as 1, 3 (64-QAM) as 6 (reserved) and 6 as 3. Only 0, 2, 5 and 7 (none)
> come out right, so the bug does not show with firmware that asks for
> 16 us padding at every constellation (PPET16 0, PPET8 7).
> 
> Copy the six bits in order.
> 
> IPQ8074 (WLAN.HK.2.9.0.1-02146) and QCN9074 (WLAN.HK.2.5.r4-00683)
> firmware report PPET16 0 and PPET8 7 everywhere (iw phy: PPE Threshold
> 0x7b 0x1c 0xc7 0x71 ...), which reads the same either way, so their HE
> capabilities do not change. Compile-tested.
> 
> Fixes: 9f056ed8ee01 ("ath11k: add HE support")
> Assisted-by: Claude:claude-opus-5-5

This tag may not be needed as per latest guidelines

> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..8b4e992b609a6 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -5825,8 +5825,7 @@ static void ath11k_gen_ppe_thresh(struct ath11k_ppe_threshold *fw_ppet,
>   				continue;
>   			val = (fw_ppet->ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
>   			       0x3f;
> -			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
> -			for (i = 5; i >= 0; i--) {
> +			for (i = 0; i < 6; i++) {
>   				he_ppet[bit / 8] |=
>   					((val >> i) & 0x1) << ((bit % 8));
>   				bit++;
> 
-- 
Ramesh

