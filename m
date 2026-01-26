Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26268D19502
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 17:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKbQFfUG/A89GVo9hdrMRrrtAKp7iLQnhsUaVv29b70=; b=eStxr4iklaubP6lKUGN8Uz5xJ6
	MN9DW7TyFOMG0Fv8C4mNmYhkg9Zeu8ZnaC7kK5CaW95XG1pqt8mSnC/ZBLd0s1kuMevHrgjPeRObT
	eKsuvSiHM5d+l2WAaaoothQf3a3oL2MKhudXD3i78BNka1/INUT3OHXldnHRXJwGAjeC+DapAVTaC
	ZfcbmnEZuaJgymcAgym/+r+M5rpLB0Mrmb+j9PWUlXnEFlimfYrrBs8CH+BzYIlg01PCUJjvpzNEs
	Z4H1vGE41z27HLKis3484TeH8j7XrurqeLmzzTrzacn2+6S3y4KdyPPEiA/T8SeNaTn0YfSEm3TTq
	Szd2VO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQO7-0000000Cys2-3Vka;
	Mon, 26 Jan 2026 17:28:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQO5-0000000Cyr2-2Kx9
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 17:28:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QEBGA33575046
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 17:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKbQFfUG/A89GVo9hdrMRrrtAKp7iLQnhsUaVv29b70=; b=a88pbGcfC7JRp0Cn
	5jVS/Nvcrc/jYLoXuMoHw+eVNoepZNaxxV1M7S2AB0PuN99oEKn5slQABmv5hQ8/
	V5aHom/B/z1ZgAhHPs+mqUuLIksh5Z2kuy0Jeyd1s125lL749OgRAkvq0g0oKi9g
	e1tfDoW/9Z/nuXfUPnaIs4vKBQc/E7fzG8p2ACPXac0jJMzFDfP36UAVzP9npKsx
	4XQZlzIyiN+A2FyU+5e7EV/aUO59ZFKwdGvNMr0JK7j3+bqNbhQBIC6bnXX87pwK
	mm4Si4c283jK53JaXQao1LZSutUOU9GrnuMhuphBfSvkT51ovd4lxwLDeihcsSIe
	yXtUHA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtycs69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 17:28:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b713fa927dso3195572eec.0
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769448508; x=1770053308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKbQFfUG/A89GVo9hdrMRrrtAKp7iLQnhsUaVv29b70=;
        b=deY2tHiYB+gZGVCHbtAlYS9ZRpoolmUJ5JA8MhCxPLiBibpaSA/USC0rxCMLq5xTVt
         QXfsGp9Vq68ddurZ0/L2KQubkPU1OjZEY6kAiFS1QSfSLtMrTB25b5I78JJmEzLSGygC
         wZemEt1Bwja1KATRbh8a4oCOHVQ/q0GLmNV9MBgumQv3d3cxx9V/3XarNCbXqnJdEp/C
         UU0FqMGqibz8Lhz07CJuRLI3D28cJxcduKKI5HHmqA6QxTuB+AFrfJvphq73eAhj8Jp0
         Y/YNExTuAfASmCDDStQkNkkI5Njyu5J5rKwTZ2NYu2/m/QAcOHN7+A8Vcf1i2TR60raU
         MMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448508; x=1770053308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKbQFfUG/A89GVo9hdrMRrrtAKp7iLQnhsUaVv29b70=;
        b=Lfg7HuIjfvTr45WEY1bfxNFttIm0MYlribMsVr5tnv01kS+H05FcAskKncKVIvTiZq
         I+ltLiCdlvYVZhNUnbTVitGDMGXE/CRJU2oLS/rnrg/Ijme/VUiH5R+kL96EphMnKyNi
         XYtIjjMe6zWd1fw48d09Y8Fx7nua+ly350tjRqEu/ZVXcJ08mDdrkwa7GB3WlvKbC7rr
         T2sOzRrhEGdskEenNfszmfhNqw379bvdoDOMTVNMxI/mFCqeikgqnfQSH72cTV6Z5ne5
         v2uIG1IrlXVeXvCtC3zZrJgWjsuKRo9k94FqS1hJld7mv6rfj7fyxt/Vl/sAkc3dbHXA
         F+5g==
X-Forwarded-Encrypted: i=1; AJvYcCWuPqzynBCNGYSmovOhAN5uyCvippq5qK+ZZWfqxTPyTarrlcw6AB3P1b1O30t0ueS2RD0JqWc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4kMYLUVkTe4LjOmazALuaxF5EjNI2mb0iYnMWtsN4JbLPwBiQ
	xwJIjmEVlcVOwh7CK1cU/VU2G/z/DGNplygSEui62PHoO1K/ciXGnj5UiGI0H0nZDmyrs5fAivG
	mqf/gg21i/pQuSrEPAj11xe3hMnlGlYPju1lMeT3EZxSRe3KSm45BGSYXZN51mpEuA9RQMewV
X-Gm-Gg: AZuq6aLGTfn5KK0PeGnxNneayHE1crKRbM95j98WD6CqAIMDt06Thk6j5ebQpE0hawb
	fVSqG/ta81IkKkRCLS7p0MsyYBYZ+/rJre5tP4paWxo0oz3gTFmS/iWmgh5TnldIqGz31tGep7O
	s/F42ADFE0oCk3rCX4czpE1r66h0WoiQq1lm9pjuiLp1wtNtw4N17qgCrMyxtlSwLsOZViBrw5s
	sqRoSk4L5e4+Npk3oDbIW4F8rZLBJ6nsIONaoFo2dCLbhg3vO3sVdvuYH9NEM7PO9y5wUAgdtP1
	JcyhZ+iPm6itCjskoV10u6xTe7qPs09lnQCIaaTLg81gnsv9NP2slyHgzfmw2XMjHcUfHqmDUNI
	1ZEgLle9AKQdoY+2gepEm7oeRuOAiEtFnfcy+9v1iuGbR/Ez6rqzecccCUq+CKvZIqj9COpb/fR
	5D
X-Received: by 2002:a05:7300:cd44:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7639848c5mr1954261eec.14.1769448508083;
        Mon, 26 Jan 2026 09:28:28 -0800 (PST)
X-Received: by 2002:a05:7300:cd44:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7639848c5mr1954246eec.14.1769448507472;
        Mon, 26 Jan 2026 09:28:27 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6f5d2asm14038328eec.14.2026.01.26.09.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 09:28:27 -0800 (PST)
Message-ID: <9c6369f4-c80c-4a59-a17a-7b4ed0d8a032@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 09:28:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <2633095a-9555-45bf-b143-ad2bdaa1ab01@freebox.fr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2633095a-9555-45bf-b143-ad2bdaa1ab01@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w-GrJcs8WOuXW4_NYjE4l1Q9swEwSUGR
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6977a43d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=SzpFk2VB_PeOq39dtucA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cWrrghZYQEAA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: w-GrJcs8WOuXW4_NYjE4l1Q9swEwSUGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE0OSBTYWx0ZWRfX52F5NWgpp2xY
 mVLJzbnNIElpU1IlyGbPOveS8Yw/F/3cyD7gjQ+G2cTJ7A8P6Gj4Fn9CPP449QjyG5w3ippeJcg
 biL2endI0OhacocC1AKHSOFdpKTrV309hB77m4R1oKKKxbe8i+jFf+U0w8fhnsRDWIdHjl6dQ1H
 X736j5/Zthmp/nIAldj2CIdIryMcWSv5GXYm5qJjTYtR++yRxgo7tEIUwtbbPCvKp1+qdWNDvBg
 zFjEkb8mt7y3GdDmFenS5afhco+hv1OktYRhGS8L/OKRPygvVXpVoN0yzr/Nqiw+43SO+u/dpIc
 NAFUyOiR9ak9vPUnAA0VgnGmImZJTd7kw3x9m7aH37ruxzcnUELAJrMV3klSvQ3BVjaT2acjGQo
 b81MN+tu5A/Yi/xC4pYeNYsOgq4JfQVhjE8E/8d23SNSj7pQxqoQW2dUaLtIn6C51/Yr4MNem6y
 4e2jvFU2m7e3BEIp7iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092829_603961_836DB57E 
X-CRM114-Status: GOOD (  21.28  )
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

On 1/26/2026 3:35 AM, Pablo MARTIN-GOMEZ wrote:
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
>    &peer->rx_tid[params->tid]
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
> ---
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c 
> b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index d28d8ffec0f8..f2327c82953b 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1289,7 +1289,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>           return 0;
>       }
> 
> -    ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, 
> false);
> +    ret = ath12k_peer_rx_tid_reo_update(ar, peer, 
> &peer->rx_tid[params->tid], 1, 0, false);

FYI your e-mail client is munging your patch, adding a line break.
And using "view source" it looks like other artifacts are being added.
My tooling (using 'b4') cannot process your patch...

Applying: wifi: ath12k: fix wrong TID passed when stopping AMPDU session
error: git diff header lacks filename information when removing 1 leading pathname component (line 6)

Suggest using https://b4.docs.kernel.org/en/latest/contributor/overview.html

>       spin_unlock_bh(&ab->base_lock);
>       if (ret) {
>           ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",


