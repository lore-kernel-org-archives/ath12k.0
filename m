Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20954C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 04:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ/ELpwOroT6yaLDC3aRC4jOxJftHTkof6pHm02gk64=; b=1J4fTOblaev8xYxM1uE5A3/Pmx
	4sih0aurR/VtIU5pTCCQU+xcFoVC5JBtN2edh0fSVzPloJnjGhk3Ko1Yu7xlQtfYSkbKX/UM5Q0os
	J3kc+7OQXJXZxJkBEI26g7+PUC+oxTjTm4jPv/PpCSpDoJnZ1oFc603V20ITzzC/pi8Bxi4j/AYnJ
	nVBPeEhXU0tYIqg6xqpf6L2V5mRLdWKYnXVXrXuMIH5ND9dLFSgMU5t4teh1IHGG2rQ8bPB+2vnQt
	yEqTfU2OkSYqfUKWbJBlaZl4RH3wiOGq1naKHSzGy0mwyiKBIr1QOQL5nQhxC8c61PoMyKf4EXM/1
	+vNyJtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3QS-0000000DfYV-3Rpm;
	Mon, 29 Jun 2026 04:16:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3QO-0000000DfY9-2PNZ
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 04:16:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T2d1P21545772
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJ/ELpwOroT6yaLDC3aRC4jOxJftHTkof6pHm02gk64=; b=n+K0TcjZVRiU6LAs
	DFqtfI+qKv568Q6Om9A3TxEx2+sigGZpIMCyO2Jw9V+lT91ocW+B4Wsyybqig3qQ
	Q9sAeUslg86aMUmAOc91920guTsukxpYZRCt6seH4z3fAIpnZsWRec6kIZ/a2aJ5
	OFoX9YiyvnpABtB/c5o9ERscsdzb8iDSInGnCe6QVPzfE/EFBi/IeYA09HzqDJ6t
	EI8YmHalj5HntYkBRnZ+l3cV7SzKoOeXQKXXIkr7QMiz373S8U0SivfBFh/aDpLI
	DGOIQvQ73WywrzHG40WRH5zIh0ED2HfO+qxa5SsIUxYSdl4CaJHKTBG322hlZOsj
	wDWCpA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084cfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:16:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c95b0e22aso10797724eec.1
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782706607; x=1783311407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJ/ELpwOroT6yaLDC3aRC4jOxJftHTkof6pHm02gk64=;
        b=Pdf/2m3yGZxEiZo8s1dZfBWlTEGhQgc12b7rUStrJx6zH5kaX04ax3TEMRAD8nMKSA
         oNHfSQIqGdVrCpexLIfpO9BJ0SgkmORKT4FH4OVgpKDDw7I/Wbq3cVWRVyaUhfwGA9m0
         LbMTwVECtW6mvQfj00VLDM6ocmbuytH7zz3fZv+cgIg3YpsKBCQqtuHmFs9xRrEISfLf
         EddHvamcYIif/SrBlAirEnM6CLZhiRiD3OFndPnf1S0e/KqRnycH84rcZdZ/VOTj8F8T
         ru2Qs1MtRN0o1SX5McBn8y3j8QV3TTqV+M3aQL8GJBXRkUn9qfMfm+d64/f+UsneAgiH
         pSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782706607; x=1783311407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJ/ELpwOroT6yaLDC3aRC4jOxJftHTkof6pHm02gk64=;
        b=iB6nKN8tdDQ1Cu6h6lXH9PkOAWxzj3KBndiGeS648TeI/wCKbJw5Z2iSyF8cNqKic5
         1uqJOQx+TiisiWmdETZdDAmaNKhGBRk4i4jGJFDt0cp8SMSqfIawj1H03u1ZJwaCO/ks
         yxdlRMaFa/wUxWNDtv+Cy6WxHNwrF7zntDu7fLG2z5OpROBb42IbA/QNI+8BWOJokQeC
         prhQhNMAuNyH++ZGki1QpiLj5I3I+l4OIdD0TM/41nlZ0FBomELBp/TkCSIaUIZqQfNE
         qQXuVXwakCfn+EaO4EvNMk4Xit9pa/+6wsWOGXC7rD5bCWTYOLlAjNqCgNPtAWlCYnh+
         Pq6g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8UShcHeeBxNubjVKtrqpP6FLjP/JVUfpYCj5NNlet8Es/tgJ38gVSjgoar6nzWheGQcsXftI=@lists.infradead.org
X-Gm-Message-State: AOJu0YylmlwFxCgYwf9dOALvpL8DNAcHA0ScDLgut4IGAZAlDfG240Bx
	Hxug88HioGaXIRZ4PnI5klyDElGtdZRvN0SDCJfO5KnJHrQ2iYLiOBGbtSdLACnLpFE4nU0F7Eo
	mBe0ZaKl3VgU8Rega+HcKrcUsTK2dTQk2ko/R9apxWofetC6/TyciwmFsF+bgM04I
X-Gm-Gg: AfdE7ck3W5T5k24HrNMER1/WV4pQu8YbeZXKVX2o6cOBkSxQf5UbO216l9h1F0VPcsA
	W6FszojahxN5nRabykuAY6Dl5p5N6zpYJ2Jq9dfbGPiPOs/F5p1PNpbahz959BZF/mvsoCcWoSH
	j4OPwvhDOzvehDh3LO3Albq1AZMREvBJ+84wyaBUcnUlD6m9cnMO9TNalPTgBjMr9HCk5qY8EuR
	alPXq3DHRqC3KgF7QowKE7x1KVoz7HynHOK6dxmY+HCgoThdLPEWK+kEd/wPvhblydWNIi8EUqK
	k5s2Vlr4aCj5/vVNE+Y4qqNjQhLhWSDMKhDZBUEu4GqGZIC4+3Hs9Ba8DyUM9vKDL/0zUI+kSuf
	4Lc+fI9lv2pLfaHwy0HPxPo3l9w3PpBemJC3yxBCkg0/xCGRaN78=
X-Received: by 2002:a05:7300:748d:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30cab4f495cmr8426987eec.42.1782706607402;
        Sun, 28 Jun 2026 21:16:47 -0700 (PDT)
X-Received: by 2002:a05:7300:748d:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30cab4f495cmr8426973eec.42.1782706606927;
        Sun, 28 Jun 2026 21:16:46 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm43439951eec.4.2026.06.28.21.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:16:46 -0700 (PDT)
Message-ID: <f7f94919-9fc6-444a-8611-339562491765@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 09:46:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Improve dp stats
To: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41f1b0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w1hz04t2yJB1brSwPtAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzMyBTYWx0ZWRfXzjj3Obr1QXFu
 U69a/+/GIhA1RN5HB1Kx6YDlqSKSz3/p9G+n1x2BitcBe2xuWt1fLCk/GsK5SWtb8sex0AnlGQh
 yML8M/TXDNXm9yvHO9JJSw7PPXKYP+cg/jzyMI9dKnGxFJBBMsDlt/sj8B64QIOg843Rk48/zp3
 IqHJnqCCMb7rhTm3no+ZW/R17X3dUVyPNrGv64bEat88RzBzJEFHCY5XHU+3HwsjY+Yivq/T+Wi
 7V2vSwXxW1vYdtC6Wwk//nUQbXlgYpmESqpqk/uiz/AcwbxM2rKPnTE6wAT1dlfvHwr6vC+ygT4
 0exszCzw/sY6EBq1YHnQsCodNbYoH6umnjDPi23mmYFvaVTv5kHMHUvZknZ8fvhclIAmRUPVO2Q
 LLP5qtH0l58GpeGRU8lguzdf1WLqfvx5KbrPe78nARhcYTFjkxdibMh6R5ycegb14t1sf/bp/wj
 BBZxHLYGym5hq8FNyJQ==
X-Proofpoint-ORIG-GUID: HsERGtyo3kO0x3zjoLKpyuRZbZFRfM4A
X-Proofpoint-GUID: HsERGtyo3kO0x3zjoLKpyuRZbZFRfM4A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzMyBTYWx0ZWRfX9DQ7n5PuwAK1
 vGQ8m7IEpKEyJiq0LbH8PXFqAwcc34XRUa2eJw5eujF075SV3YjNfggVcJA3c5skOSYAyeawPxD
 8GWIzxMvwz/XEcS8h2qyVJOXekUnNZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_211648_642923_971C8838 
X-CRM114-Status: GOOD (  16.60  )
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

On 6/26/2026 2:22 PM, Sreeramya Soratkal wrote:
> This short series improves the device_dp_stats debugfs interface in
> ath12k to produce more useful and accurate diagnostic output in MLO
> configurations.
> 
> Patch 1 fixes a latent correctness issue where the REO Rx and WBM
> release error tables were unconditionally printed for
> ATH12K_MAX_DEVICES columns showing zero-filled entries for device
> slots that have no hardware. Replacing the compile-time constant
> with the runtime device count keeps the output compact and correct.
> 
> Patch 2 prepends a ktime-based millisecond timestamp to the top of
> the dump. In MLO setups the per-device file is to be read
> independently for each ath12k instance, so without a common timestamp
> it is difficult to verify whether two snapshots are contemporaneous,
> making cross-device counter comparisons unreliable.
> 
> Patch 3 extends the existing per-radio section to report the center
> frequency on which each radio is currently operating.  This allows
> the reader to correlate throughput and error counters with the channel
> without having to cross-reference iw/nl80211 output separately.
> 
> ---
> Changes in v2:
> - Rebased the patch series on the latest tip of ath-next
> ---
> 
> Sreeramya Soratkal (3):
>    wifi: ath12k: Use runtime device count in dp stats display
>    wifi: ath12k: Add timestamp to dp stats display
>    wifi: ath12k: Show per-radio center freq in dp stats
> 
>   drivers/net/wireless/ath/ath12k/debugfs.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

