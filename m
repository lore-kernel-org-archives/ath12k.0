Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DB8C44507
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 00:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=; b=PoNKEy2rfkc4OGw9KOlIaZ8dmQ
	5yaXUzK+hEfpz2YUOHsOluI/3Q7WXxxb18hkd0YjXd9zXFXzUl7pNZ7tyxBTi4KT5wKxC94R0sik4
	o61uI7ikvrEID/8LIdewLD8/9mOQ0EGGgeFb+uE4JffVw6+5R/WEFhbdnqMlVksGyBFxVzFxMxAmp
	gXrPmBjC/o8Mk3xPBJ5+A1JEpvCoQcgoDlopMmZCaTNYVgLzoUOkQekE5PGXVF2W8c40WU562Eh+a
	hs1alMfetXdqI0ojI+Y3rX0Zsv45mauY/pSUpzjldQaCUifYIoRd3/sb8BIUMXBJWALO7/qhuuOvF
	KG7dJgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkARS-0000000GA7Q-3pEp;
	Thu, 16 Jul 2026 00:59:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkARR-0000000GA6q-2IMx
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 00:59:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XxCA968383
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 00:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=; b=kCYoa4PF/NvUiTHG
	6+87jHuqfpW/wdcMJteLafDiQmob/cw49hw6YAq7hUvZOwCNFjhgsP8w1uRWviTI
	KnOpag0pnRAYExClazyWzGCoQNiPvBis0M+wrUlU6x1j76cm8ZoL3Nu9Q5KpUn5B
	scF0S2pR8yb4i65bbJmobSmccSNLnttQkvM9DFh4wVX6an6uPh0zPF9c42ZSjedC
	iStyp4B7J6g6P76jvuQhVEA20JkilZfCBgS9KvExMdTJ6hGMq2bMoiZukp8AWQG8
	bZT3rRBKrqoxQTk0EpjbkbA5i6wFt+wf/JQ4ZVYjq0zh/FDEdZrHE11YYr0nMm5x
	8EIMCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kabfmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 00:59:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2480733a12.2
        for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 17:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784163548; x=1784768348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=;
        b=Rla4DTKuLJcJ/Rd1URnsImRkYJ5GgZI8JF0emfI1QaGGzDPS8UY3egrA/ojlK4hS4u
         Ykp6qvsdxVzqPLsQH2LDih9A8QyvKUM5Gwq7avp584QpdfMhwu3NARfNZuYUdqvHIzXw
         iTyzoZowYri6cEh2OwkK3xvb4vkMzSMtW7IKb8W/eW8d15nBFtApQ3etQ6itFX6brHgp
         xLtg0E70Zzs5GVhkbEsyJbvGDFXTvX5Tx/WcbumkfIhkRpAeJO/QWsnfQmQTeCZXEqQn
         b5N6dIbxTuMOLcYtKVzmaMeU5s+TQ/YDwj1eyBKCGlvU8e2hVgxYDFwTTis9uwxF/xbA
         o2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784163548; x=1784768348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxSym0MG0DTsfrTZy5yY04eAKQV5OakSQtDa3iUK2PI=;
        b=BOWYzIw4TjfDyda3SzHQdcC0lODZ/tQ4MabB99RNt+8wfwe5/J/KXxl2cAJTDL11Gv
         Jizc4jnmXaQt279G9iVqAjTXNXblhXKNYkeSM/jeOrLc1W6W9go2IwzzWXMfLyMAyM1E
         Nwxuw/OEasnsC33AOmoYE+KR7n/AtLbjxsHxcost+Di1M2uftlqQbCIEfU3xcFZoYsZ/
         7nTdl8lrD8GV3RDfGJptn/fzCh/OSyTVI8YJFVAE6f9PVJvWC+wDIkd1wTWcwbgpsLOj
         NGEii8V3DqN4tM9dIlWxPZEgQAgXqG6gxYJ7x85HY1tVONq/8NbXOJVydWd50zmLrDrO
         gRKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8yfwbCy0aSt4+2t9KNcHqKzPpFUCSwdP+WlWRCHASC4OY8ntdYCsZoJNHyOUPVb1FcBauWYY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5qgDRSns09utYFJ7jJH8BB6AZYiQHKJfh2HpTJs2Ehr+qiMbe
	QLxMv83vQ+i3KxDLgUPccxP6hsICrcD7kfpy4Mdr3aTy1DeCwhNmJK6Njgvg7GVQhf3H6j2bKjo
	7ySh/IkqymSOHF3hhPdPhzA1AZZrOjr1xNQP5lVMRVa/eB+UHOUoGDeaKPY+ULrKg
X-Gm-Gg: AfdE7cnAbh4rEBGhZcmLjiszU0A3M0qvFBv5JQtd45HizE8lay5y+6cE2AGc2Famp4N
	zafqdKU52YZAe+yqpt0nb5ccXsQQVsaYoojS43MpxVatRaPtBjKgrZWr2xhemrvPvAKTQ4QIccV
	+VI7bjNbz3An3wqhs6pB7eyU72T419sSsEuRixzIgYXFxnGJx+5OU2/+h4gSx/yybi8KuYdZf+E
	yvlSsC/7R8sLFOuvAgBnq8UqV/eO5hRJi17E24yrZuld6obRzmBfKwMjlId/eXL7EPUEV4sAuEZ
	8YjMRUo0pO96nsufLD9LLTZxYnoPCuixsCa5n11Xwoc83J095gUlVapHcYJ9dbmVd7+bDyZzrhf
	aowN8G0XTLUGwqvkWWRcOUV+IYOVha6QJ8DVnW/fK2dhL5qjFstlPLIkYQQ==
X-Received: by 2002:a05:6a20:4307:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c37dfd2500mr2681261637.73.1784163548066;
        Wed, 15 Jul 2026 17:59:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c37dfd2500mr2681244637.73.1784163547629;
        Wed, 15 Jul 2026 17:59:07 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm5588023eec.9.2026.07.15.17.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:59:07 -0700 (PDT)
Message-ID: <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:59:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k/ath12k: release QMI handles on late init
 failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Anilkumar Kolli
 <quic_akolli@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Kalle Valo
 <kvalo@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20260715064042.1988288-1-lgs201920130244@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260715064042.1988288-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a582cdc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=jDosp7zG289F-1VKxZYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: hcuXs0sdj-14breBZbsx1UUTj2ZjRSLE
X-Proofpoint-ORIG-GUID: hcuXs0sdj-14breBZbsx1UUTj2ZjRSLE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAwNiBTYWx0ZWRfX0/6cjpnoy+pl
 kybdIj1SN6SV7NPlVpQEGdBAo2+V94e69YCCnIc8k5YfzFDOa+0Ph6VxlPF6PjC3WvlJ8ep2InN
 bbyipf575b258GxGwtdAEs6Iupm5jho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAwNiBTYWx0ZWRfX1UJjHxvioRP/
 aJVnkkfHsklonUIVcXH7weQk8RZTqnl2IYn0GCZgi/h15GN+YWDDsk+QzeFYdE8oQxHeuwrE0UT
 661YcVYF68oyAH0EGi+aYVh9RPQIEPR/z99VrwkjooFyC2wcGQKiaJ2kkb45DgRLlMSUH03+IAY
 XoAU4WC4vOCJfr1vwgDc7ib5/AP80/mnNtcro7If45WZPJpkL9a9q/TlrVR+V8bc/QT8YgkTb0H
 +vTU7yAhbSGLqQzsQtNXyrAcrw3Xxf5mTzjT2Tu6SRMfkxNpbzmwQy3TaadEcLEcPLuySz3wzD3
 iLkW7nW7is8yYjGXt/Zh7tR1HCiTT6U52KOUIKrR85LRme8xve16Yo+35IJ1g7rwTMEowPB66UD
 1aoQHJjoNsQfktlbpQpZXCWcYwt4TzpKge9f0lqryAEfleni/KezPDLmXlEY0yhQuwfHdoyrWdN
 ev+mkpV5cO4qr8eTrCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_175909_605160_CE6393F2 
X-CRM114-Status: GOOD (  14.17  )
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

On 7/14/2026 11:40 PM, Guangshuo Li wrote:
> ath11k and ath12k initialize their QMI handles before allocating the QMI
> event workqueues and registering the service lookups.
> 
> If either of these later initialization steps fails, the functions
> return without releasing the initialized QMI handles, leaking their
> resources.
> 
> Release the QMI handles on the late failure paths in both drivers.
> 
> ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
> service initialization completed successfully. Set it only after all
> initialization steps succeed. Keep the ath11k assignment unchanged
> because ath11k does not use it as an initialization-success guard.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
>     as suggested by Baochen Qiang.
>   - Fix the same late initialization QMI handle leak in ath11k, as
>     suggested by Vasanthakumar Thiagarajan.
>   - Drop the Reviewed-by tag due to the code changes.
> 
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)

Please split into two patches, one for ath11k and one for ath12k


