Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FC606A325
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERW2FBH9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bZITptod;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGY8S5sX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=; b=ERW2FBH9Jnsytd
	3s4wGHT2h38Y2WXDJ4tK4+pHczr2I0UP4jLe1IElEuv73VAZq7gtDYNyyeTXsS35ieRS2TKmILEZU
	1etOv4PPhpvGWNwRcr+mZZERnhQVdvGziC7UDkWDkWV7OvzvzbmgxXU5sUsAiiFSZ/nhST43hbnlU
	XvQigxGYKb2uH3Yz6KZEzXVyc19OuCsawm5yEV5yItLk2LwSzp6PmFyNnzDF7hcxP4EPDqUnpk/NQ
	j9KVSp0tmIds7CYsbmlwvVVGo95cXy1bT5hJ1VjB03IWAua8mMgmL0YfmhZPXSw5lEtKYd21bmc4n
	/hFKKRBtHntm2OlRz+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfkA-00000002iav-01nW;
	Tue, 10 Nov 2026 06:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfk7-00000002ia7-1GdI
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:54:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ABU91207795
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=; b=bZITptod6jUXEZTV
	RTmKSWH3iXK9ZY4xekxOzuhI4YdAh/46NictV+MLlFRS9mrGrjymC7KF5JGhkiLt
	D0sEPYUBt8o3X7sfWn7MlhyDoy40HOoXcxpRZN7FE0FIuu0/656KXs905NeatLVY
	Q8fVVXFhPurDlVTY4dCyM4EkdS+BZ9GlDdlehG8nwsKszfTmr4xkUML5ZYoU9b88
	/fhOm/iXPFmsPeubTUE8WBesvcI9eBH7vU0CFtpAsKk+hDNKt9o95bs3wsnjeNcV
	uBCHmbzdnAnnEpN69u4O2OaQ/3/FtMMv3w7zT+g0OtodHEkG6FdO7CuQIDCJcTy3
	bx8pOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhwpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:54:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so105043eec.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293645; x=1794898445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=JGY8S5sXKm8JHFZ8C8RQtTSpItGoYV6I928Hx2ULfgjo/TLzhSH88zoVuXPyLixmHX
         kV3HNzBEeV0XmzObnju1+iF3am70scWVVDDv6S61w0fFhCZLWUEVCxLpI6MdaDm8X6nj
         n12pA6dW1ezyHfeU/Klx//3h+xfgpDY+Gt79JG17JGV/zQ4AqONZg7QUT3arfZ5Huc/5
         O0b5AtaIcYYkRH7/5F1uYEZ8sDfirCwybqcGAUmvGAq3mp5NrjE3zMm5SM5n2y84+2Se
         TdxKyU2DHDizJmJOi/lradJehflkBxYH9TIfO9R0qy7BSKW4ykCaxfy3HgBZHS9TTw+L
         5ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293645; x=1794898445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=xnjjZVx7kmC1ntbQqe8oNoDk1nA5MILdwcgc2CxEG2D5DzKfmWMooXYKb1wxIeci6A
         nDrUIQ+c2X5qLNWKNto2Orfp4N3eSnt2ZNXPo/9A4Nw+h049qMphYqo3SUQ9rmTDLfCt
         1WDMsB1RfUap0Hwx+5ebWtlWuH/zDzg/tnBVvFMM3ule6UYlLXBfJQ5GXVjc7TMyNKGp
         pCriy9di4W4MdNk+UCuWEUjXgBHZePCZYSfIMEgQtGP/f6ScbYYVf2/c2rmEj/wv1OnT
         5p43RW84m0pYHFY8T/AUtJQN/OOGF22XH2+DJxzeQJetCwIK/h5DQ0niFPaevbjhSQ7O
         xJ1A==
X-Forwarded-Encrypted: i=1; AL+hErERgBsqPloFiSk0JxxEemiyEIZWUfxduIv34FGYf4zWUubyTCyG6LHAqDurwx2V+mG4YPzF9uQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z95J8L9FKG53TICXFyfAeuxBf9bSruigXIejdck2liFsIMSaEH1
	V7X9JppfT7KGIGTca1sQcb6LFq6VfhXYiFtnGar1RrJfkko4se5rClE0pQgedQtJ88/mG31b+pC
	4603mCS0mHi2kfyYDvgIOE1FHlJxwaZsxt0Wbc75dh+Nlp3USXWBRtStufJRrfFGZ
X-Gm-Gg: AYBFou1xGRao550UkPloP3jvRlNkIMF1DlPYsByL+A4n0Bcl7Bje2kzSgudiC5A81Fq
	JlXej+J83nx6u6uidMRdBrRrpt0UpZQv4sywHsoS/vzF2mX/uTO0VzYZoA5FU8r6uNsyYWhxh8g
	udsJAOd17wzLaq0TKw7u8sU968Ic9kKlyJXysA63JRiu9q4imptPYSKsDzKPIrDI1pduSvph7YT
	/hIlOeOSm2eGsSBHw/HsnmhnmKX+vvHN7go5mSliVfZ0ZV/RZo6Qqw2u3urtzlAc7raao6oC8Yi
	M0Acdg5+RYflttQTYJBnwl7u1xJIZfBMjjBx5uY+o5FvMMyvAWDz50kw9LYJlwjx2MirVvhQ1Sw
	ezSP8LsQtvfCf8WuACqd49ctDYfmukLcMiUMawJ4jlFYjUm1Ar1Za0cPqurnNeYNSXTyqqTn9aN
	Rp+ChUqPa/2rVwdQ==
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124980eec.7.1794293645033;
        Mon, 09 Nov 2026 22:54:05 -0800 (PST)
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124940eec.7.1794293644375;
        Mon, 09 Nov 2026 22:54:04 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm5190187eec.14.2026.11.09.22.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:54:03 -0800 (PST)
Message-ID: <e269da8d-f3dd-461b-93c5-ff4c81843918@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:23:59 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
 <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f8GbCVzP8qmegnC1PWlzLV3YTyzzJOT_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfX2OEj84xSt4D5
 eVxR5HJllNJkjoh6MbEEOE5Zd8dGLywbx9NHAbEuUWmpnLDLTtzHVOcNok4DVDJ+IdbEawnKKIJ
 ofRN31a6woFy/2IQF5IFxiKdM29Y0OI=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bf8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_icPHbadw2IDH2Vg5WwA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: f8GbCVzP8qmegnC1PWlzLV3YTyzzJOT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfX1vjwdeV0TYvS
 VLWsCn7S8HVEWRpFk+8EZJ/BYfoPnJaJJfm4znR7AMvpWUHVC4MpxocysPW2QAbsJug8d5j9Hj3
 leZTjKHb9iIsyGMFPqu0EaydHoF9wrmk+lfqdPDph26xRD3dodoQqudJ7xW28n2xe+NzkOfRwRT
 tjCZK+effapiQCdphxpeJRURuDwHV9tvS3Co6ZhwDcDqEW5fQrDU38aStuDAu7T8dLp4E2HZHLq
 N2lgiZgCvxRvHc7wdCazIptaCIryEgEcUG8Hv6o9tiWTa8+MITK/py1m00ahPKaNHva3RRbGacx
 R2tNBIqT+D8lDMOWjv4ZHNteBnc9vtXNI1qwBKpt3qiWYPO4KcjssoHur+v9yYEen60usoADPDZ
 8V0v34To47ozoRwr7KNuRTSa4vtfI7VmJybka3XxPIqx1c1Omr/vAyjZ9CUNRRxa1jFsg8FSln7
 5zbwbRTxytneSSgEyag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_225407_487436_5ED6928E 
X-CRM114-Status: GOOD (  19.27  )
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

On 11/7/2026 12:18 AM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
> capabilities into the WMI layout one bit at a time, shifting it in from
> the top: val >>= 1, then the new bit at bit 5, six times over. After the
> sixth bit, bit i of the field sits at bit i of val, so put it there
> directly.
> 
> No functional change: a userspace copy of both loops gives the same
> ppet16_ppet8_ru3_ru0 for every 6-bit value in every RU slot and for 2.5
> million random threshold fields. Compile-tested with W=1.
> 

this information seems to be unnecessary as its obvious from code.

> The change, this message and the test were written with Claude, an AI
> coding assistant.
> 

This might also be not needed as per latest guidelines.


> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d7ae9e8747233 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2496,9 +2496,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
>   				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
>   					continue;
>   				for (i = 0; i < 6; i++) {
> -					val >>= 1;
>   					val |= ((he_cap->ppe_thres[bit / 8] >>
> -						 (bit % 8)) & 0x1) << 5;
> +						 (bit % 8)) & 0x1) << i;
>   					bit++;
>   				}
>   				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
> 

both comments apply to ath12k patch as well

-- 
Ramesh

