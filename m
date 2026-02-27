Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD76AFEFB70
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMrPipa8HvJb3/9lpgE2nmap6xaDNkVZJrzrCWhAdos=; b=JTDFKkmgrHta1JE1K/J/HgkFUC
	A/QzOF9lkOM+RE+OwJjiq1b4yHpfaAEHZmLy7vS20Eu5iUJ5827H/l9AkiCZUlNUfYOpfylKs5DPh
	0Rfbe8XAfuunhvo6XQskZuPy0tx8m2SLY6clVqqJsN6hwVQatLMTVlIlKRu9QVelOqpFhoa3YTzqY
	YpEIzv2aWqkCOHasF5p254tLNB3gNgitGHuEMZUvsHepS4qQRFvvfvYpeKWboy/7jVUTQRWXS/oT5
	U5tzKiewnqB1WclN874Kk6WPTQN9t2LeUvoZj/73vinsi+15BNhqdduWi4azPGkbsUyqKLda0gyak
	ZKY6tQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw21s-00000008q56-1fv7;
	Fri, 27 Feb 2026 17:53:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw21q-00000008q4b-1doZ
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 17:53:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0G6F010536
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 17:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMrPipa8HvJb3/9lpgE2nmap6xaDNkVZJrzrCWhAdos=; b=d8Xh04m/ZBDFheJ+
	aOlPak+XFlBM6mx7qWCnhhpCtTsQizZilzWLJRGvCi5SLHIl/mCObobbZs9/r02O
	yjJWttAzfnEQHgBlZP5JB2m2Sn3nIpI3ZQ/vl071YqgGPW/owGCdgE3aSUWYDlG+
	9k80+ZyvcVGXNze1mNrnKsh1c5li62NVI5t8P4xYgzgTJ4WY88AmxRpT0WBuC/Hg
	v9otYS1LoRMAoiGOHSSpN/xWvJ2fKRm3vVzygEQSWNoKeoWbVX48+EilPKbdQbzB
	2atJjSk0jtYkEfOQGgTDzk96dRO3re+mbSY5nRaw7L84EVOkfEPZ9d15WDrycsT4
	L6i2hg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytuyq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 17:53:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso9003401a12.2
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 09:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772214808; x=1772819608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMrPipa8HvJb3/9lpgE2nmap6xaDNkVZJrzrCWhAdos=;
        b=DLx5Fd/jQsqknGPkTHvgkWi4xbIZeX+BE6kGK4+rGUtcJ/Z7FQCdlDvNjLxrRSNUWK
         hPYqEA6qvSOfUZA9MbZ+soXsUxBrjDp1t3L6z4MTtfLB6+nppfDI8KvX+RF2JpGkQivy
         QOoMp7Q2whGJQgD27EX0cwSoFzYP//d5LvfrKYmjN/2oUcYcoGCRB0/wGhuBK6XnKYdm
         JSpORQAOtCvpsLZ1yPTB0EedINr/7+Tz6M6LHTzMeKQN4QcVtJyDYJ1iMUNjnhc2jmKg
         9chseBNjlXvcRf/GlSc9wl1SotVemJ7gqkNZRVpVagMrQbNoGzraN5vbH6THRK4WtDq3
         6pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772214808; x=1772819608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMrPipa8HvJb3/9lpgE2nmap6xaDNkVZJrzrCWhAdos=;
        b=nVzY6CnWlFM2wwNx3p0PQQMXE99QFhTGn8YGZXkqwPVXgF/bMEDIicmMgSVEz9MBMj
         eel07AF6FXFnyY/9BiKPDR9jc44IAGAw7pdBYVGV4qCHJPjPdlUk36+JC/7D5vCKWiW3
         4gxF7UyGOQU8VwvUVrzLUwIrJAN851tieascervqFybaCZaqE65GsFqOQKIBOomuIcnj
         2Pdzszr9Kbwdw+ncQFw6VgIRk6/hgQGZmioOWYnkkeW6kT+2TrLyPEtQ/srtqKg5p257
         rqejSn5rFVED+Qh5lmysjsDNWjvAmuyl6AcNconxMmy4f0Gr1q18rWFmC9yx2+WYzQLm
         PLug==
X-Forwarded-Encrypted: i=1; AJvYcCXpff9wH9mUQyg3l5T4Ynf8IYacl7giBcOEzTx6sIM5buA0ayM9P6cfPXTaXamN7chQ/a3O+0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yysu0faN72aVIsxhztuqK26+xJSClMqXtmWAJdUTidSlO0mdVQ4
	S7MQEBXFpdiDPws4w5uolley3bN4JU8VGPdXluVinkXMrIgPixmb1slTIYA7tPIkLJEj2LcK2WZ
	gJs1zbmNXe3dUE8EAL5MbjbNjmlsEHLePT3TyyqmaQeCT5UK8rhokUQ9cUSTr2mWM
X-Gm-Gg: ATEYQzzQpF/N9OgVGPFMMnrhXJUXAo3bEB2sZ7yzC/ruMNS2bWnWHktNsOerJrZ3K2n
	H2sDZDzer5HljltQS3ejfAKAgfaC9ZCnczbr38CG6K8MA8vXtrBB+QXv/ugU0MKFru7zoRPNYAD
	uqsSinVHg5aiEk09HSCQF6SnFsfEqLE80aUXssHdjHCU3NqgLo/pmJSiOm4PyklZSEdB+X9G9Ji
	NIsnDRrUT0L67jUys4yj61Fi81dleOJyeuxUWhbY1rqT5RJQen2VWHCtHTMII3tlmNpfOxxA78Q
	Do6zuZwXEwniZ9o1MM9gBjtVloI5Q7qTX513bV2m1PNFmTs/0qNR29lJ4eaZ21+r0xjDsuoR9jx
	NGLSLp6akDmGaMaqw6VOezr/iGNHnaJuMi9w//u1A1FqEUe/98OWMGeX3/fFunBVGnH8dRw1cAQ
	==
X-Received: by 2002:a05:6a20:9404:b0:394:f5a8:512b with SMTP id adf61e73a8af0-395c3ae6cd7mr4063937637.45.1772214808354;
        Fri, 27 Feb 2026 09:53:28 -0800 (PST)
X-Received: by 2002:a05:6a20:9404:b0:394:f5a8:512b with SMTP id adf61e73a8af0-395c3ae6cd7mr4063911637.45.1772214807801;
        Fri, 27 Feb 2026 09:53:27 -0800 (PST)
Received: from [192.168.225.142] ([157.49.228.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22e7sm63991695ad.3.2026.02.27.09.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:53:27 -0800 (PST)
Message-ID: <0b472b7b-0115-459c-8208-ea92cd7b1f0a@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 23:23:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: account TX stats only when ACK/BA
 status is present
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1da19 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=PtQaxW6Z2JPlFy30ps15hQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MXFVrN99o-6Q6YR7G58A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VJhCLPGuyOP9X0iJd6ZhY5MA9fgChvu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1OCBTYWx0ZWRfX7585omy2J08f
 f4ysQxADdBbSPNaKx9Dv8lCE96mwIDfau/8TpngZhXbAxjsTsTm/BmgmXQyuRQvvrxD6P5nnZvJ
 1HlDS6YN5VKAgtWjBD7BuCO8JX3SswJB0azW1qJYqYff3NOqk+ZB0sKtBeFw9Ln4icDBgjQsic3
 6Q3G2MpUjHuQPWnk1gnMcPWPPyK4+wqVtp/mP+yGkVyZYuaYwTb4NhfahNY5N4ODmBy1FIl0jRc
 IggnIwLB47v7e8ufqWrIdePbxnlioFoY7cZaBFuO+Zbx8UtjASDzMkvjBQaR21m8nPAyteww6e0
 Bw/pvDj1T+XtKz5GDOoo2zoIMwRZUxO8YzboS6rLBoGGQpkfYnbgJDem3BVnOfF2EiH++c02n1E
 FLndse1Y/nDDah7FjgtXtGHzXJM2lJ4wAUti13XkA4FciCxe4PqgFmZiC8gsfpILX5teLlQnPlH
 jT7ryYPpcR3kcbW3oHA==
X-Proofpoint-GUID: VJhCLPGuyOP9X0iJd6ZhY5MA9fgChvu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095330_572122_F607718F 
X-CRM114-Status: GOOD (  10.89  )
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



On 2/26/2026 10:49 AM, Sarika Sharma wrote:
> The fields tx_retry_failed, tx_retry_count, and tx_duration are
> currently updated outside the HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS
> flag check. In certain scenarios, firmware delivers multiple PPDU
> statistics for the same PPDU, first without BA/ACK information, and
> later with BA/ACK status once it becomes available. As the same PPDU
> is processed again, these counters are updated a second time,
> resulting in duplicate TX statistics.
> 
> To address this, move the accounting of tx_retry_failed and
> tx_retry_count under the ACK/BA status flag check, and similarly gate
> tx_duration on the same path. This ensures that each PPDU contributes
> to these counters exactly once, avoids double counting, and provides
> consistent reporting in userspace tools such as station dump.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a0b963e1da5b ("wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv")
> Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

