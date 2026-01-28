Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A182D35672
	for <ath12k@archiver.kernel.org>; Wed, 28 Jan 2026 04:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m2MVJFquCUf6rZalmsL0Ff8nZ7ouqP3cLm1Wdrs14Y=; b=iOLwlTJvKhHymAi3P5AN/htF3o
	JWzst/E03jPo6cihVsbSprz3gZZjDdweRoZTCDb233t6Amm0T6c+uRXfjbGYRK/UMAe7197KYTaDd
	QH8HOBTR6lggMY6s7NqaNTA0cyRSHbN5ttWg6ZZatY267lPFLAV1z5Ie9BVbPk4fxksoFzFZFn/js
	RDI5ITenRP9DRyIkaxjcsFuHcLdCbW5RuQKkKGrTltz2V84zbXNjICd5UP8owWoYQuvSKYqtaIMEs
	rOYPXWBoqKySppFV+9zU6MkG4PIBdV0/HZrkHcm1fuzCFFkVK04UDzUUHYJFxZgIH57+G6sitbztz
	9VIPtm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxLe-0000000FQoh-2E03;
	Wed, 28 Jan 2026 04:40:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxLc-0000000FQoJ-0Woa
	for ath12k@lists.infradead.org;
	Wed, 28 Jan 2026 04:40:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3aqAY1952942
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 04:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/m2MVJFquCUf6rZalmsL0Ff8nZ7ouqP3cLm1Wdrs14Y=; b=WI/YzHm0TIGGohq1
	nlI0uA8LhMRegio34PNgkoQU3yDCVnbk5Tr390SPTbavoOS6Ab5Cf6MjmN8xuWfZ
	yArV5U3oM7mQdpj6A8rETPZvDO5XHEafc46FPr1LJjeqNSUChLjLRIQ0Oeph94P8
	TODZ/QNdVUCb24Pph54ruuqpuhrSTzjpEvNT/4wClBDA++Jk0Jj0Q1zT/AjNu4gE
	rJF93fXnYol7udUhZbvb4qQwWKzidOzTJL3O/Cw2SdcGFWxTVmS9FtTnUqRG0fXl
	mc/5eY0QRaxdvWoBtZlF4nkvwEdVj+kaKOH/KOu38zM9O3iGIVpMH6K6+M3MkTDw
	vjf3qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2119tr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 04:40:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d058fc56so47458265ad.3
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 20:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769575206; x=1770180006; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/m2MVJFquCUf6rZalmsL0Ff8nZ7ouqP3cLm1Wdrs14Y=;
        b=Hyc9EEkIwUmPxPb76BT6d6v/KAmTvSkGiC3z/TIrYJrSVzwkDn7LaiPjehoECN2re6
         cdR8OaCGFljH93ueko7R00GGkP+C/2l4rOjVftcerm//8t0wTs1dIuJhBIdTo4dSDHFW
         AKs/CcaLm8wdgY71B2l/U5Bh2u+Ja/JSjODApEnnfhA/QfzXTWUkhd5XPa8EtZo0gHBt
         xSwNmUV6Pb3ztCvXF7GnMcy6ZcwEHoh3idAQhkBS0nF/IvAOy16eiEOVo6RuIHMfX2Gy
         75HhrUj3w8eTqksgH1xzuDKKikXBj0Jb2szNVcHFUEdh9mkDHPERFQgJxBXviML0WYHk
         kSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769575206; x=1770180006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m2MVJFquCUf6rZalmsL0Ff8nZ7ouqP3cLm1Wdrs14Y=;
        b=AAJecXadM7Ncqn7ZOucWD31VzDuwPdnIj3guKfnNyBGjYXodQety0POfTpGDWCDowx
         0GdmTBj75LiQGBYzyIunmDvs3RBDcKMBKOBSGaUK98aQOZUKCEA/qrS12G9Ov84JsoBo
         4LExnaus0UEO83KVlzm/8tr/PwKzFIycCBemyEtTUFcwYIhh+G7PIxDOY+eawNNONWm0
         PJ78Y7VJ5TL7Uv4WYjvi1wogfW89tckZFLhW+xLEdfRFpiGvi5+FJd8sddmZTzmYZR6V
         FrZsMnH6CyLz1eJCogKsV8vKzW7mcPGEubrNyBK0qWQor3/AFj/detUeIen/XR7qFEom
         c8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVdkXj4bnbg7Pxhs9JLPNvjocl//9ZwbvIiPAZ0dSp5pOvH0wrLfRsSaiiMYNzDaqLNHxQq1yU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9nTHzd3NYfTA8Z6cF9NfBWyczf0LTowAHtXMJjfX1iTMA0wFN
	alBuYVGRHo6VAyVHgRGUPdnrNB21agVAeC2MVZTEeLYeDfd4+Uu8z9sjLXGXiw+cHfvuji7z1q2
	sd20NDQoCFPiuQApqz+c2TQwYib8IBzQWHa8pMEInKUo0lasrcsxbjraJSptOMiat
X-Gm-Gg: AZuq6aKcXHTR0FqgxBzEj/mfNgFvNTkCTlszNb5ygrLUc6xmYD9rphumcWB8y7qdJYg
	cfN1vnDtnuU9Z1XkrO2qk88GQHRozkRzIP0V0TCySpd8UziNtCVVb6UtDuZFZXEQA8uUeCT4bv3
	9RFUENvo2zkceovgaqr7UkKd6iVbQdXuiokUenFNYRvnnn/cTh4bKu9i7zMSRo2F2FzdZHQMP6M
	fW4T+f7U5POKrTMnjM8dtF9CLFNDh7LBQj71isvFFiW3in19E7Opg6lgD7GIMVsXh7Zg3wORySV
	M+L+OArh2hAr1kshCxOlxKxdrfCBToKIjPR7m9Iv3nQ6lomi/R24AEoIr0g+I4ZlGVMKGMsQGsu
	l8KhYFKi0fjoUUBHyZlhmykPP1v2ntM8QAuezSzwA0T/cWoGzYbkivK0=
X-Received: by 2002:a17:902:eb8d:b0:2a7:b412:6cbf with SMTP id d9443c01a7336-2a870e3694amr39557635ad.55.1769575206374;
        Tue, 27 Jan 2026 20:40:06 -0800 (PST)
X-Received: by 2002:a17:902:eb8d:b0:2a7:b412:6cbf with SMTP id d9443c01a7336-2a870e3694amr39557425ad.55.1769575205800;
        Tue, 27 Jan 2026 20:40:05 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4317sm8438905ad.85.2026.01.27.20.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:40:05 -0800 (PST)
Message-ID: <4ed536c2-e584-45a8-8c37-60639347296e@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:10:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, ath12k@lists.infradead.org,
        jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAzNCBTYWx0ZWRfX3mcndPN5UwbH
 iuWavP9w9k8k4XzRVLw84GUXwQMQLko26GqNO5R/dlPdGaD1m8RdMqMM5/5B0YDlbuunnrXFc48
 KeQCxSoaoAApuIUToqHiFpR51UTYdjauwnzpxDHQDBaZMDW4NWKqZl9keu2YaJ6qeqH//SgFi6u
 MvBmW2oiBFWk8F2w2Wn1nNSI1dsbiGeL2drct+YYNTb0+703XnTZpfgYp6KhswL+CCvwsQXBlhV
 VS4kl2Pkhiy4Nr3AmBhIHoYD+o9n60U7MGO2mpeIBil0rOG/cu3lh9hUAOUrhd5ir6TPvF4Ia6U
 YuVRoCe4FhdpsQeQU0T7EgfU8OhWPi19Y2tlVbOkKZRVrAj2BsJUSNzj3Y+Whf+C2zirFfXVSyl
 6yYq2/ev81h6P1nCG0IDNlnMwUib9QBzN24s4htaLBZHku4UIJTgyy8n0wg8c4qUGKfbP3gad7B
 2J5QX47uonNBYzRh2uw==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=69799327 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iWM9MhxghFcvANyY_NEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: pJjfNfRbIzpkIBXJevKef5daPpD3Z1-d
X-Proofpoint-ORIG-GUID: pJjfNfRbIzpkIBXJevKef5daPpD3Z1-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_204008_188256_146CB59B 
X-CRM114-Status: GOOD (  13.96  )
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



On 1/26/2026 11:06 PM, Pablo Martin-Gomez wrote:
> When handling a DELBA request, ath12k_dp_rx_ampdu_stop() calls
> ath12k_peer_rx_tid_reo_update() to tear down the BA session for the
> specified TID. However, it currently passes peer->rx_tid instead of the
> entry corresponding to params->tid.
> 
> Since peer->rx_tid is an array, this decays to a pointer to the first
> element, effectively operating on TID 0 regardless of the TID in the
> DELBA request. As a result, the BA session for TID 0 is stopped while
> the intended TID remains active.
> 
> This leads to incorrect BA session state and may significantly reduce
> RX throughput, as traffic that should use aggregation falls back to a
> BA window size of 1 on TID 0.
> 
> Fix this by passing the correct TID entry:
>    &peer->rx_tid[params->tid]
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

