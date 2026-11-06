Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAF606A328
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 05:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3zW6A8yF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6hMBRZ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFhKwxOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=; b=3zW6A8yFRyJplt
	B2NqsMwRsYRfsvTXMa/N9LenhDV5ouYZCXWk6/MxdcNkbmpLyVAZxcDaBnoU/lls/tmS+2Djogifr
	pFf+QcvJGJ75ZqUSH9Nf39RLmOmoauoOQhD9uc80Xn2MgP9uU2pev8lY+eWoXSVRpdr6/w9nn9IJQ
	AOSw49ThnSB5l6d3WBWa+/4tjurKXuI1sT4rt4A6TWb9gAVyOmRaNTRMsf7YPk2vP9qZU7mooCUnf
	H5x1DTchPZtBQQ8eUnjFoCW15/BggaM4KIXxZw4qvMTY91xOBGzvGB/vKc63s3t9R4h3sPaWS/qiI
	+MBZ8QzPKLCKlcBHZreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCLQ-0000000BFqv-44s5;
	Fri, 06 Nov 2026 05:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCLP-0000000BFqc-15vo
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 05:18:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640Uhx1220188
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 05:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=; b=B6hMBRZ07j9GPB7D
	oq9yu/HbJ2GEFAKwfjO9W0DugjJO6njmGlwttciROW1UUDQEuPyiYFeZdwswUHmt
	8yTmMm+VvVFldsvE5zwRMb8HdMYwuC1OdDClvCGD5kJvI25DxjVyzLD8pv3Zg9Lq
	4iViED4YWFLyVsd8S06kwFF3GINRjcTmf6mwVPfL0pmpEtzXEtOk54YLcsqMT6dV
	4KoFSNpg6HIf8T4pqa3+3llLIBf4mcJFMGg3M2IF1af5q093FxZMmHJRoAZoHA2L
	Q2yY1GQZasKRaKCPtj0wX23MEXxjJE5O+jn7jbb1YDvAsD3rTjf+HSzBJmQCeDuH
	nUPUnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc91jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 05:18:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso665125a91.1
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 21:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942310; x=1794547110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=;
        b=jFhKwxOvHh/b3KJ319YDZCZkxW9bJL3da7nPJdbpWSZdg60YKdt31laHVgAeVJY19s
         O1OqwBKbi4MpC8jEv9tr9pUOv7acfB/vodC2JR3Soz6UasUVTb8S7pXAUgELpzxpevv7
         4kWkeG1aDa/BmpZJX99+Gn6Adg5bJvy/5UJl0i8qvOib7oMQHEThHvg4Qbv3mXlHHQdh
         V5i3w3Z6qcHin9zmzblU4a8s5oOn0wmGWWeU2G8g65iBu60QztjAbIAn3kWDnFkXvWhA
         XFC0FlTsh6/Ref671PdRaCZ6ASvHAsBfX+bsaiZWaSI27EceNoETq5PanSDsA3aiKJhC
         D6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942310; x=1794547110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHm7fq390Dtjc8Onlz0SZtEKIajeqAq825ln7gB1Au0=;
        b=tBlBJUFnC7CzfLcCvrejquBBiygpWtQSSIeZJJ8X1Eu1A7vZ8g+RJ4FDcZSu9tRBl8
         vY7/Bx+Qv9pjOlwZyi1dDFH3w2o0QUWjpFSHqV9eqKzxWPa41yNwYIpwAbbAeIWjigWF
         Ie6kaSy96wHJu6zKhi1F7Lm5oxLxUrIcskDn1JeyfRK3LQ3iJjgCDuxK/1AoaDBIrHvC
         gBBXv6nxz0RTNyrARct8nrQa3BDD1UOzabrgSqI9eeo2IbcwkNtgyAJm+Iae4Svt7cue
         jc1Z6hRIDUEsg501Nu7pssqez0EwOB5ZfaSH9NJ8e1nuDv75sIBKAAoB6xSI91cy8J81
         Xh8A==
X-Forwarded-Encrypted: i=1; AL+hErFZNjUPSXC+ykzsoMzkqLnFVG7PFweKqpoD4mXlneHGS3+INsgBNJbOPfKJLcOoJUkKHtBhk3U=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZDR3FWwC0ojKJ024FkYGV/HGaedawclMyRMEOBiXf6G1gU/FP
	4IqiQ/DerHuZarobaD/AIMdTTEuiUDPxvxlxeVe0Pwwn/Dvu+edJxp3ioiilBsFgP/Tm7Vn2FUk
	zuKntTdoX1SmMVQZn1o3TSrykjBuJP08NzsaZHjr5N1opPkpwG/RfobBgYGrwpibS
X-Gm-Gg: AYBFou2sfLUFQhQfUdsFkVvBCRzkdWWKl9qdO6xgUgSUhMMTRjlXVpS01wOt3hRkqn8
	cI9fwqcWOOqxUkK9Vu6pTjwnwAURqM29JfUTAi+9Mn3f/aIV2UssF19A1KoC/4yfOtONC601HO2
	7ntVaEXMcWcSndi3Q4VCIctSIYI1jk0Y1X3JQnmkUliI8Y0yjxCmntYaddNqZBlEV9EYcpQmxc+
	m8dXkpXUMeWqPLVqeNO//QAELLePt2soKejMyAKqC0/l4d3yvXTNAUUciKOZHgzIixNT2iIcLId
	bPwgrM2rzQxKvnSlbqMdJsaOcaIlO/YC5svvm7DsfFvQvTyesVmnCRokkk/YjJNpK5HAedavzCa
	S+M5vn5I4s618QtxVVhsUVALTU6vn2jqc0mNhN5kjbO7gwNWimmZqFIDWq1sujdMr3F3MxQQVqa
	ArJ3PT7gokzzhYJOZP/oW4zrYrqgES8nIN/Tk+6hFFyR22
X-Received: by 2002:a17:90b:1fc8:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3b0db6a8e8emr1372399a91.11.1793942309929;
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
X-Received: by 2002:a17:90b:1fc8:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3b0db6a8e8emr1372385a91.11.1793942309450;
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm1762352a91.13.2026.11.05.21.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:18:29 -0800 (PST)
Message-ID: <23e722c5-c569-4bdb-a01c-1e58c77c639b@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:18:25 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DiiUPdtGgreH70Ka6o8VjqDs_tKByxg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX1bZdBFbKqmgo
 3/uIW/aMHu3YiSuhlQd9DT9l+phmpP6O4EBJ8H85a//BEzzdmmXgw/5HQHmU8sDbUlqHOpIm9u9
 ES8qPbMquGHnoftbmLz+k0b0xfs7Jg0lMmLTSh09cnuna40yv6Ba/whnC/UIE00GdsPrwOzPX8Z
 xPC9oKm5+T6fB5ICaomtB6203VCQ4HLtnBX/bY9bqwEUl+/tMx5JolfsmHrCXMD1I3JpkiUJN9r
 Z1bEjyLS0diI6zRuWlLgMfxZqzS4Oh6bcfCBeQYwtor4CSNm/C/Be2hdR+/mvZ3SlTocCa8m3UZ
 M/0GH3pE9CWZlApN1mH7jdfDOP0Oz4PuahISJiutwzFBYCpEYLq8IcKCxTP1Smp5GoVTeT9FjAA
 vqEbRNMOzx+94TTtXJ1BlbOoMGnogGDNMP3OYOPq9kVPpGrJHiqGf8e8TAzfl0ocXPSUKKIsqlG
 Bhrn0Er9JDLUb3iItgA==
X-Proofpoint-GUID: DiiUPdtGgreH70Ka6o8VjqDs_tKByxg4
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed6326 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pKS8v8zPedG5d943xKEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfXxIACx56uOYnG
 rjDhQHK7LjPS1vknT0qb+hqKTtmQQ2QkCgYuVtyJms5fTRiabgpYjZSoWJR18nz8DqnbM3F8X/K
 lrZ+TNzPHBpTw/boSudZYBNNwhWGLjs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_211831_332254_2CC2A1A7 
X-CRM114-Status: UNSURE (   8.97  )
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



On 11/4/2026 10:33 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

