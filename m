Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E6C43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=; b=3gEVdl2Re4u+O6iH69isyEnlb0
	hucTKruPQ3DR4SbWW8THKyjkjDZ0RZfN79DS/yQZ1Q2ZZz8QYOvlN9d5OA/Px1b9pX8i+GryoK/jl
	iLexLzkMgQuPS2nDy/9wGLdz1MoVWrufIyEE4jEw7UkFBPgmLGjQtPzmmEBLbMsNe2oe6hJdZPqnj
	HoqLY5CL/585WA7qy2N24sKxaEkwix6msyLLO4aMPSjb+l2YlLpKx4pzzhRnQAu6S823ukln9iIUa
	H3cNQUMeBjmUb2PwdX30L5I2CcvchaA8LyD4hAS3t8+wuIf+0MiBw7A5pKVzRw3pLcxGGKCn8eFIi
	gte6iNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV2Z-0000000GUvF-1xcd;
	Tue, 30 Jun 2026 09:46:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV2T-0000000GUtx-2a2U
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 09:45:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CIHZ1030659
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=; b=dsBiNXF/RxldppsU
	2WhMEc7IsBVQsjGrGjivxsG9bmDTSIasTuPBOGdxAPbViTIoA8Cqu/VbTJ7bRs4K
	KQbyCOtvQh5j+Gdq3NC3q0OF9X2GsqZGE4qMDF3ACBIk2bnCjDJaOXIIwU57Sqo3
	bXdc4BYbYy7b7rZnz0dUf2oT0vjb0ldeTLRDSsavyVbIPUnBOYdtCFHXZoeZpmop
	3VPiTarGeFUeV5KmFIlvsu1MCubuqull251J3wF5u4emMtsZO+9AxWeLzDbbqmDV
	2hzKZjiG+GP1TDYFCRN/DI2TtqafxhTEjNmIz60WoUk1eyUhR8rco+js9bIwjFL0
	qNEZlQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1qmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 09:45:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso9781849eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812756; x=1783417556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=;
        b=GjSZ2AXo03pt2inHDEDdWj3BlIRTAEcNjNqA4cOf6ge7p9fe9t3lOfx4MPkFy0G/XF
         lbZ/pwZrTgx4a8kwm6M3bM/nY778rQkNY9zXZBJ/v/QqeQo9uFl/SvdYp+gpPFtmHFn/
         JTdJAjhUZWnTfY+GXanPF84jlPjF8fhLRgKBInJCmgKGo7MzRHx4cgJg1Z8XzgpnUoZA
         wEWWMgoOAsXHZUlLm8OnzVnZpJv5uSkealf70NbF1ZrF6ex/rXkpj+LQCZzOFuAqN/ut
         k7QTeQ3RXgB7yc8CKgoQx9Nsoy4F17zifhOpHxmlN8g1lnpwCDnVe/amIrwhct0kyt7c
         VtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812756; x=1783417556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=;
        b=AZ/RcTzktZEVnEsw5Hwrw4fzAlTQFA2eJz8G7EG4O5TKgGLQXqFzvmKUeav+e5GLru
         6UinSUfCwU/rUNsu5+DrzkMuA9tHBY4Y3kCMm38+m6HZni3ZYHIU9VM9RFeykP6LuSgv
         zO1vdFbktQTxr5ke+Rnsiy4qD2NAS4/k0zj4/vL55RPUD1VCLvxk7hrgGCnAI7UBn3BZ
         wxis1i1EfJY6T87cGhoVRYgSbduxHsXA+joofBt4XEhaqorTiftUS7cmu/XQS3KICZKP
         XhH9W1/gjejTD3J9ykadqqoSGh72tSfQ4iBZmSAu45KRE4D5JKPxFEgzNTog2GyFk7sU
         uiWg==
X-Forwarded-Encrypted: i=1; AHgh+RqCGC/kn/bcVsfCtD0t1JuIM5klVPSjsOUPvKqE8XfcZTgtGyYnF8qTJbJGoEHzuGq/RA9B5zo=@lists.infradead.org
X-Gm-Message-State: AOJu0YytnE2vWyqUgsVcAVRSdN4WuaORkfH5ineK4sl9C9tyswUXYlNi
	S2/LfNHLVtXmktuGxaIhIWsC6Iy0oVz7BkzzpGeyfMRctBGc2Vu/GtOtr/Go+NIRwlpJuJDiwe3
	3aubu2RHaYT/ZnOtFbH99PVP3vtq6IyT9WXb6L0jsCZCl4avYtBeNgT27m9Uxil/HIjq1eazQ
X-Gm-Gg: AfdE7cl774awVW6P5OZlqRAkn+2bn6MdwaIvUZGtuc4dpC1c3NzzKHfuIs8DB/JzRBK
	SlEwscbNtPRDEKoQ5LvreLQx0K1Sv+IpL5xctzbl1v6hhmO2UoOM6WPO9Lev5O11YQtDumk/oOP
	hazJgRCepgdOWZvSUSWyuQ8OpIHs43G7dSIryPdyDDOxZGHnLY0P95uJ1ppWw3MwcZg8dLPOJO3
	YEuRh8wcmgxtqYJQVTq68xkM8fNFll6H4Gc3YwgaqnbiAQiiGUCO2n0Vk1X80t8DC8T4jd/UHI/
	TjVPgXbmvXDjSqapDjlYbkzDOGJST6T66j7WAjkIUehLg6OCoGZThAEWRwT66hlaQq4Akr/bjcO
	BRCTRwFpeV1Fj5tUipKf3Er7QJH3NW6uXxxWoafw=
X-Received: by 2002:a05:7300:3c2b:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30ee11ab8a2mr2614920eec.2.1782812755978;
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a05:7300:3c2b:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30ee11ab8a2mr2614893eec.2.1782812755481;
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5e4d1sm6137828eec.6.2026.06.30.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
Message-ID: <eee587a3-2264-4e85-9014-c230988de6db@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:15:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sbhQoMr4BFsLn3bHk_OeShDjyHjGBVL3
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439055 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-ORIG-GUID: sbhQoMr4BFsLn3bHk_OeShDjyHjGBVL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX3ZJqGmai/tFL
 TaLlcSWpwok7gEY3Qr30zoTqGzJ6sQTAP2T5ArFAr/Wx1cB+QjULq/JKa9N6J+Mz+dq3DyQTTkb
 PEjKlRkYzAhOX9mfZHvoR2fEnOdtmM3ZbqwG4KKE4IMu8h1towIK1fiA4qnEnAGt17fyI4lJFHd
 U/gszjFK5Wx4lqJS55LuFGUYUmRkmPg5C4RFc17gb8vSTgME/YON6TycOmHBZKckEPzPIyj0Hrz
 luYf6utk7TC4fSkwMfFVLbrEPuNmuV6wI+n9nfHQMN34C6UkxRfJGmj4dhI5ITdVOtD2Ixjvb49
 bTWe9KAZ+QBVRuZagfoyyjNKEa68h8Kxx8fhC1e7A95FAB4ysfgnwwWdLlbFoMXcjxqUmAZZTkf
 Y5+p4dlIKwbHW92px5zzuRhGYChR4wgez5Boj/zH62pgxAPstOGgb9i+hyv4M9d2+vvnoiO+KVq
 +LP27y75LLC7cV/TftQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX3ovFptLRftRU
 EgBbql0OKWkpknBJOSE5KzUVvN+SByeSbxgfqPHLyWaIZLMmvDRRNRzfDzd+yQFiX1EslEIo4g6
 VrgceIYsgs37rWkhGQQLxE1UR5yq4oQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024557_667538_E249FC02 
X-CRM114-Status: GOOD (  13.91  )
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
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
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
> Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
> Reported-by: Alex Williamson<alex@shazbot.org>
> Closes:https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

