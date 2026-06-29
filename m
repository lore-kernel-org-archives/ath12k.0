Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC90C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSB0reBPDtDL99zajwr0RLPp3VzN+gGCdtccsuFCvQs=; b=GHowoh4KOfgQp4vgaxtBykpKnA
	pZ1zq/FK1mCtyNEfbI1NLiaL/UKwfs0byqzrMMHwwp+MNeHR8Tm+Ac1RsMHMGLPxkg3BLv7iV9FAz
	LrYv5FXXYby0YHUtNgM4J1FFqb8HMahrweHjHXOoB3+Sb/j5Ft/Seh0uzQML5qrXTXXwiq8cOg+Jm
	wFF2yZVE5h0bUPn94KqMa/OTZ31JJQZOZcq0ggdx87PYb+IvuIyTO3vd94WkQlD+bUvGFKYB7vLa3
	POXDEj2lQTgAd3rZpZDnoJ6YO/mIWFFWKvTQyYyMS9r32CKCtNH08Nmbt9oFiRCHIsGB8FSaRTja8
	zWPFSdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Ox-0000000DZ3b-40nW;
	Mon, 29 Jun 2026 02:07:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Ov-0000000DZ3H-2LLk
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:07:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9DZS998125
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSB0reBPDtDL99zajwr0RLPp3VzN+gGCdtccsuFCvQs=; b=d8bsqv3fLPk/qF2z
	tBG6Unqc6v3j5cJu8q8H4Lj3MOQEKHJKN4RK9zDk2QvwvUVYS8A0BtAcBssCERwp
	i/W/0RcZBuqBUbauvfOSaicb66OmnN5aFo9Ouuv1PYO8leX/4gOHy6qhgFCzYS4B
	h6RvWToBCwLNVW1t2Ei9wnUCfGVPPd/sGgfzBueKf9dk6bKNutsXEJFy476xpZtY
	jf8pBKCQL0AJGX49w1JwJR3SPxk5K1et76j7Fd/GUjqwgM18CSeq3G7CcJAfPnX/
	i2VUFG2ltDw8399bMVqd20d+nYh1VA97Lh1G4nSskGsD9G1UEj5Um1Tf+RTRtTmn
	StM05Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuv3v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:07:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so2984876a91.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782698827; x=1783303627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSB0reBPDtDL99zajwr0RLPp3VzN+gGCdtccsuFCvQs=;
        b=IJTIqQbsg2PlbFDSLdornkuFDzgCGAqmsnaBmeLex+PltXrKMN2PNneO46IyC8WioK
         RKbat1QMfzxgbfItL+dBtvoed7SxqnXS+KIDILwJLWMfk9J9XmFEI3vewwvoYntnBGLE
         Ru5+iZ4pPtMeMuLCW1FZqs7lCG0VwzTab0pZKWNL1hfJ6l9HpagM5x+mviiw+Nzel8Bu
         OYB9lC5/jvilX+jpxuQ7g38QHVw0dOlbP+rru77+nkrTHUqbag43iH77s7RuniTuIevh
         mS4l52ksypQy/q+K3KunqiriB/HP2F0wZwOJUXSxZcTNmBAd8K1evSoiFXP0bNlg6AS9
         nlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782698827; x=1783303627;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSB0reBPDtDL99zajwr0RLPp3VzN+gGCdtccsuFCvQs=;
        b=FogkjPfk9aFQWBjnI6U0fQfiJCUfcS0Ou7VfE6jn28RdT1yIuiqds7xvTJbQJhlgZ3
         l1OTmw3q0El4dyGyBf+47CdO+Fw/LzYkVg+hM6uD/WeqX583br00aWQh/9pTfnLXXxHl
         YwVutAty6OiqyZEx9O/WyEJJa74V9JdPdD7SpkA8h0b+COORsDYlsA4n4WRqmCzhMbej
         PdOlSdpbOLBWnvO72vDEyu+1akrAANXOXcuQtEm4Jtsbu9ESpBHEUZpyd+tbY1vHVrhZ
         KQXzHir4ZySuIHSyatjzWvP6HZ2XSsoWiaktABRLtwXU0vSN2vfGssdFefQYwTrjthCv
         QoBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0zuIPEgiMN3MNg+aMA2v6BUo7/T79tBN/tRTRyX8zpzYBz5JPRDD4KKQ0GvR0OuztiKpjtbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrZzUH4Wh9BswzWUE+xEUbNY2rhiQddSZEV/kB7C3XXgZ/y1jl
	qm6sgX/Eyi8xY6YGPYMZ484mV5+lmBFan7P6DoGJ6vqX0qtI4wTD7WBQlQvJYUWBvbKBoXmtSfN
	mxqf3tEHgpTBYn/tMDi424CXd9NCcGE23Xlg1N5jY/LOjiCeE31rD5Vb13+6ETUI6
X-Gm-Gg: AfdE7clpEQEDAUn3Y6ZI1NeEq1Eg6C43QbQnS2LXKPOw2co7rQgeRjlVqcnQWZrcF6U
	+s4MJIEJ5ib0x94+tdWklMCO8vPAZRvNvQMjV6TEMUxFMIvWo0An8nCQR45eGORRZ2GsWTJ4LOv
	VqBaHHEFjw3QLaV7OJBGpaiaasdan0w3xwyboFcrr64fiiqjAyfFbwIzfGv61NoV4LxTBtEtFky
	c1bq7jLW4D47KO/lJlkn3eeY9w6fS9YkaNxxOpQG1TTeZHEpKRauj0a5crVvR4t5K8PQM6Ya6AC
	StLYwO12UgW1JDizqxOM7c2yffo0LCB4+nSZD1xCHDAWOzcnl2KrZi6/SxYo5+FF0p1ycyLnUA3
	dKjJbttdVJ/tQrTxb8EiAtHTfR8Yb/KQFWVkwB5cv2a9I00ob8PRPk2UUg6IuC6TUXbqCjqEeJB
	nyi10ybw==
X-Received: by 2002:a17:90b:5109:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-37f9ce221e2mr6559144a91.33.1782698827286;
        Sun, 28 Jun 2026 19:07:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5109:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-37f9ce221e2mr6559124a91.33.1782698826868;
        Sun, 28 Jun 2026 19:07:06 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm6787856a12.21.2026.06.28.19.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:07:06 -0700 (PDT)
Message-ID: <ead6f52e-79f1-48be-b068-2e3240717b6c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:07:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: correct monitor destination
 ring size
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfX2RXWsjT1G53v
 4VRFU/CWESOc8XrLuNIMfC8iG+anbxR/BXZ1cr/N5X4JDVeSNbCwag9pIzNsAnAhNSaW0K1ETKc
 mwaSyCJzG0+McgZyM2Sddc4vl7U46Vo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfX0DRh1QMjS2i2
 qQblPFdjgxRdI/bXEQK3Ebuy9AgE1gE5+B235I+u2HZhCjtvWMZ1ts5u1rI4WuyWwTDS0N/764l
 OhVAaHIZYNFBpxBdNCvLAYcXaBEtPcAH7kgZNk6+fxTWfbOGcrC539xRCx8D1u4DkVvyNGvk/p/
 UXrM5idjD6t8BK7f4UL3zNTQPId3Bw9N01jOH6yYJ/F8jBRIz5n4vTOWC09OuLu8KUp3FBptM2/
 pX08EMNQpHVKPIDtP+oAaGYL5xZ0SxlyQz1+rlCSk1jMlr1K8R8JAqOboTvSn2JdNoEBasmcH/p
 iy2PgUz/Z+39pIM1E20RiInmcIs53Qcx8rAuuLfJowi5TBEG9UnyohP50ZoNxifTtNaV8X+Oj6N
 x5rHtqMZbVoHGoOU3aDRA2N+j8g7gP4CG/Lovl4sfYz7NMUG7KuPSlhUDvryuriU5J3EpPSE93F
 CuO6cqLUmef7Yq9/h1Q==
X-Proofpoint-GUID: nOnk7FSJ_T8Mogs3Lza_rXhG6aW1KOKr
X-Proofpoint-ORIG-GUID: nOnk7FSJ_T8Mogs3Lza_rXhG6aW1KOKr
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a41d34c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fhynap_7OlJaTk1KeccA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_190709_713463_AA9F26BE 
X-CRM114-Status: UNSURE (   8.05  )
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



On 6/16/2026 2:23 PM, Aaradhana Sahu wrote:
> The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
> which is a typo. The intended value is 8192, consistent with all other ring
> sizes in the table being powers of two.
> 
> Correct the monitor destination ring size to 8192.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: defae535dd63 ("wifi: ath12k: Add a table of parameters entries impacting memory consumption")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

