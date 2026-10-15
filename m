Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E151DCC6B38
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=; b=KqzwQ63h8NsHGXnYK1Kaqah3Tl
	P1GSkQ7W5PxfJhEXlTk1H4ut4cGUhYUfdjBHYuQSfGajhdWKi/fuO2+XPn2tnA9COTFd+3TXRtm6/
	KmylCaWN+HWYft5rFqtaIiXt5B56MXKF4y7sv9fo9bXEKjRFOaMA3wRg+2qOeCPgzykDD8ubRFoq4
	TiUXAgFlu6Rd8sF42WqZ8zy8hi/5frQUDad6iSser2ei0W5PkaIkr6v46HnQu8OzdSTbZt/9pQTEq
	30N0Efq8XF/w3hI2rfoE2Js9JXwQL2HZbSsJzen2pKyCF5cZzA2jKGrwxEc4pKDGQDqh7Yt7XF79e
	dkxC9LPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERw-0000000Gu9l-2RRw;
	Thu, 15 Oct 2026 05:56:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERr-0000000Gu7m-2kiB
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 05:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=; b=iNSqz49gdA06djGikKJwg0ddRh
	Si7/XhOFareiCafWrEjnEYP5hc7A2yZaWSQdnvm8CNSULgym+Wxnw+srM5BYFYI2vg7stllNqxEjW
	NVIOnEr879Dixll+JZDhDz1vJr0cgPhHZE9/ek2G+4GEhowSRsFT1Y22cReKrsV80PcZgCE3bpoRE
	vqzYkYtk5OhYQRmA1nwRmbejeLyKqnrFpdpEf+Mk6ZnhvqPV8aAIFYcyaxurBXDr3RdAoIPDuwrir
	jNDAKlcqGJTqLzFElXH72my1NU+TsXXk2dRsGyk7IK80s0gD5XYMx5EeEHb38vEIQfFU5k0AirDYV
	Qatz+LNA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHERb-0000000HVP6-35IM
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:56:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXcnG644607
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=; b=DYHFVvy/G3u1EcBk
	P7BLTsjnjKFyK9oBKSqns1bwaN01FjrJb0ao9ZwRQZA18Qf7WXgtcQqkfDiue4LM
	j8uW1U6K8OrGvpMaO0xCXvExR7OQreGc5F/5/ydCaIHYTEWv80RH+80yZt+JHd9Y
	5z0d33HFvkHRxtwIIyWAb7vEkAbgPt7D8le/dZOQ4iYQvEvjNCo01dOpLyFV9HEL
	BNi5j/RGYyUbVZekLYknqNFhYE98hF+ivXN85E8YEE/WjG1/BIJ9Ku+8TEQsYppM
	ZBSjPjvkgQu4fp8C4wFMOurLXf0shpHuJ7dxtBTU7/fJOXCk7y5saCcpGBEHL9Nj
	fx3Dzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9bcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so7952176a91.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043754; x=1792648554; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=;
        b=Jhin1CN7Am+JaamWFsvWBvgvCfr7EWXtTjRg+/Rd6sY3BAbFTMkz1B5+GAABT+2/sN
         m7J1fs4jP2uA00f83g0S0cXxuVUH0t8ZaPodaO47YxZtlTpSjXgZjzq5dzmtmI8nSCOB
         ok/O5YawQnVO4kd/U593/qWDwlE1V00I/MGRa6/L4+pcyC4p4q/HulGPMuHv2y+c6J8f
         lvD4QtHDI0NJ44Rx7lL3xsENxocfv+407aese2WtJcZaH56o2XRxx1kqYRoY9zGId715
         egVYOVB+2VUBsBq6awehgsEAZXYtd369AVisYNGNUHVNsypQEBBPmgthCBln+6gOD1fY
         cW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043754; x=1792648554;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4LFn1C1tOpT6EXzpx/sVjw2jA7YZdECpN5nnDi6rmU=;
        b=ab2yU+cL6ElN4F+PgmJG7IfaHItMppQOS7mbBdOZAkp1U5DHvNe17gd8l4ipgpw1fr
         3EwkzIMC9P/EIZSUHcdbnqfoqO4OCev6s6hKaNXa3MBF/CIJIhIIYIYDO9o8SCaoDT4F
         eXMBDDSzGAVWDRcAaxkkAAZ19mX0hVua9KKOcPF5w+SPKsZb+fNw/zRgK/Bomg6p6+Qm
         joaCY4/1AFai23DQjZ9b/6wyBT4MTJsqsI3kLn001Ll3ip8EhH0f8rDpl/u2Yh0pC5Du
         JNuLV5BTkvSSekRy8ZbAfMqKqy0PkaaO8RJ53YAq52FI9r9hkv2GtljxeyeF8FgbkAFX
         ouMA==
X-Gm-Message-State: AFq9FYJDDQvyar5HUW2q2Mmk6c0dQmfShq6sLCW7QQnc/W+clUbvx2QI
	NZ4A3WXRXqqxPsNg599NKgQ4yf3TnlvBOXV174951JIvuLLDP80ldIrMtOuHPKdDKURzmpaQr9e
	DFnj9R7+3GFAIZNgyrbjLwGRMGzPsG43rE/ZN3E2y61M5m/nl2ujd2ybF7y+OESeU
X-Gm-Gg: AYBFou3mxIFCCX1eCYKfZ81J3SC0popOtusMAySRS7/7EUCybK9Lqi8rk+fBAGf8daC
	KUM4igBwrWNAbuFmOd7FQbxG0tcPJjmfszacnCGVz74JQG2TrjqIvwq3yrQWoG+l8C8qXRg9yag
	dLWqofeW5rcH9vVvKnGGUG4I1Rb6Nj+JwhVkMds6mkxjuTR+o1K7m/8ZFtw/RtKAmYo4sM98cAR
	ist7KzlLjs8BiMyOUPdZSxu2n/OTZq0JfVzyq5M5D4OAc6xQOC57n73fghvFnxCutMFoo6P4Nba
	TUS9QPtW/t5tPJPgZ/OhNV230TLTBCamR1FXttUQtubXQ3jr5cbNy5FYlUVF3fhWc9z16SG8AcB
	P392BAvzb9/uRmGm+nU6mNm8HIn/wSryNk5f+vpGrV4k0hG1FB4+Avhkj8I+972vq9Yv5YSeB
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr16543060a91.62.1792043754041;
        Wed, 14 Oct 2026 22:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr16543049a91.62.1792043753534;
        Wed, 14 Oct 2026 22:55:53 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437b95esm2634070a91.2.2026.10.14.22.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:55:53 -0700 (PDT)
Message-ID: <d265ac9b-a162-4b88-8b41-0dd354179e2d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:55:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
 <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
 <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uq2FM_XhAGCmLZZLBsNeNTDr2n-heSAg
X-Proofpoint-ORIG-GUID: uq2FM_XhAGCmLZZLBsNeNTDr2n-heSAg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX3vYC6qivpRFD
 L83LTzMVYPkGUZo9jE6nL43midc3PFKcubn5aK74MkJ9HpLpM+Ztw8dJR7q+GcGe26j8gF2mPtf
 zEHtWOnBCCS3yj/FzlkPmLXavsxgOnY=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad06aeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MPl261hcqzs-rJHzN6cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXwtCjF/fVWsqj
 S+/bw67vO/QRkvgp7nmtG8HS/i4V1NFZAvTSJzs74iAcLzx7gv7iysZF/i77zP9qEkpu7B1K85y
 966X0iblFqxALObPMBrm1d0jRRoIR0eUzfXAxrb074LxFif+Ww+BLbb+nz3PL+Bdm+7coElqBSF
 iQT2dwetwJrlMpHR1skKYNQGchLPuyLTqypLgH80YhSlfJMaQMzXyxQ32uSt8PXP51Q4NiBY2FL
 bGtxHin7DApXp3hFgOlGaPhOB3pRhFKacZYm5phFfcyQvhVfDmra6ScxgFa12vvDZidaqt6fSye
 FNltjyxUi/wWcPscWmvxpmgyJneWu07IaqQzjtwXZHuhmX4jhgjmW0/HlOLSjLH9PCRs5CURjB4
 PEZmEOnrjeg95Shq4eI6O8rGLay0KrRoOs0za3yJUdqgpG1iehTtBJkrn2Hl5W4yE72hnuiOHew
 9hQaXz6j8m6zwQeNlFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_065600_299479_69CF00E2 
X-CRM114-Status: GOOD (  15.46  )
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



On 10/15/2026 12:09 PM, Miaoqing Pan wrote:
> 
> 
> On 9/29/2026 9:42 PM, Jeff Johnson wrote:
>> On 9/15/2026 1:00 AM, Miaoqing Pan wrote:
>>> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
>>> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
>>> succeeds, on is_sta_assoc_link verification failure, it takes the
>>> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
>>> the dp_peers_list.
>>>
>>> On the next connection attempt, ath12k_dp_peer_create() finds the stale
>>> entry and returns -EEXIST (-17):
>>>
>>>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
>>>
>>> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
>>>
>>> Also, there is another error path in ath12k_mac_op_sta_state() that
>>> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
>>> undoing the assignment through ath12k_mac_free_unassign_link_sta().
>>> As a result, the link RCU pointer remains assigned and a stale bit is
>>> left in ahsta->links_map, which can trigger the same -EEXIST failure
>>> on subsequent reconnect attempts. Fix this by redirecting that error
>>> path to free_unassign_link instead.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-
>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
>>> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create &
>>> delete")
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> ---
>>
>> Baochen has a more holistic approach to this problem in the works, so dropping
>> this patch.
>>
>> /jeff
>>
> 
> I believe the patch that needs to be dropped is this one: https://lore.kernel.org/linux-
> wireless/20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com/.
> 
> However, the patch itself is still required. @Baochen, could you please help confirm?

Yeah, exactly.

Jeff, I was wrong in the internal teams communication. Miaoqing is right on this topic.


