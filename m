Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A72C9832A
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4q8PcKc/LALQELqeDQHOETFsx0GxhuJarxyxdMEMOo=; b=MNGI9rPTCBGi+RoEyuGE9UWoQA
	+gv+OfZgNII9Yo+SkHOtW47QXsVvZdXlKRiS4si+95JrDk1rveB8n9GGz/EJdY0edy6RQFKn20x8e
	ysNMyDmLmM0cQYqWQFzDoOWyz/8lwD+qJSNzau2es2ff59E5ymkyK2QdMspT15GmWNC8YPWxYDoPs
	o3afNXJ159/PFLe1S1zJIW2vSZhKRYOGGu2d7DT9keo1+GIrGjERuDIcKarOvplaIFScJwHMgaRXw
	BNp6KmXS81skgIdMEY08rnaD5keKWdnGl657eAg3pLURMc2eddUdpDbXqYZoXmnowOWxi+4u+052n
	Py6ZZVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY6c-00000003ht6-3o5I;
	Tue, 29 Sep 2026 13:42:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY6a-00000003hsR-36GS
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 13:42:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqcdM1576980
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4q8PcKc/LALQELqeDQHOETFsx0GxhuJarxyxdMEMOo=; b=ITCSzNyrm/C2l0os
	cTNFBDHKMZM+8ds77Kjc2401zZHx0TrxHsuh+tscdfu1oQWM0YP/PU/BdQhh6cLN
	c1DEAmZ+fW/5/KmCUB4oAIOpAkm9dE0h5oa+g0J3B28srtIz1XSDeEpWRJEbsDPG
	lVZubpuiv8zbIxULnEU2njgTuLLc1pwRYfGOhmfXjZoxCEkG/rwnvyMCEiKaXGqM
	4YCEhdLH8m9kzfsPp9YeUv+3IadaZy5gDKb04yNylI8g/1aH77klohi/3OI55PAP
	pEPj7a3dMdBfva0NlRd0va86vUQvwS4SCIPgavHOkLO1af3LbhSlMa1vsBmmkxBz
	O4JyCg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s9ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 13:42:47 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e937c5bd4fso2083877b6e.2
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790689367; x=1791294167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4q8PcKc/LALQELqeDQHOETFsx0GxhuJarxyxdMEMOo=;
        b=eSHC6UfwaXMN5ROxewOvGzI8xPZ/1Gh92lIaxLXpDHjBFFiioA0NjxSHEU0fqKWjgZ
         eYa9Et8KrTje2vAvrlnJVANMmdMz4FEtnXtUSMPkO6BPWwaiG9n5qDPmhnHvy5qPXjEd
         91zkcKKm8d/kGtKWMDyEzfI6JawBsch6iloSQMygfPvGz57RQ40uFepE86ZNhUZX4CMY
         y5ithJQ8S2pdQHB493io5YhNIht0Lsd0KBjZGg3AILL+71XmyYGTbnQ5JlAHI6G+cIfX
         MYoVhwBnPBMtn7VYk8RvsqSOkaVk9u8iaeK+ejc+SknxcU60aTfKvOB3YgDJDzhyC6vb
         T9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689367; x=1791294167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4q8PcKc/LALQELqeDQHOETFsx0GxhuJarxyxdMEMOo=;
        b=EV+mXuXuBcLJ24/bxhkC4YxHdjhJwNGN1wEE0OKBowkkAqw55wRa/2QQjAV9pv8spL
         WteBTIEPy6qnMiPhJzlXzvAb/EnGRQmjRGzQU0abMEhB5M+jzBuuqxo0Al4QSEH4a7Sk
         udTWgDGIBgEB6siJJLN5yi9y33yHt7WCZbkCoZ8M5ldF5aoOJKes1xGUAZ75JzXM9PbK
         uO/iakhrqSkoibaF0OUhGgkQ3SgaE1l1ggExkzEaS7zABD5baAn5d/fDW0Ts/sAPCm9p
         SN2UE0Hn+RkXmpNheFMUvCUAz6PECFZaqboAewz4DfQ+T+nudZGZuCkH52u51zqsbeO2
         WeYA==
X-Gm-Message-State: AFuF++kSm51Gs9sd/m/1rLddX9g8C7iSU8gCYT+sG9+nIDUZQutcsnyP
	ACpnGLScPB+vuyPATDjaeN+YEwxp5JniHsu1QSSdr864Qz7usuqaZpYxwAm0SV+DhD4tUO+6Pzq
	RucfhLvd29+l+/X5+kzKIWG7SyvOpxS+bO0QpjV/gGrp6vWEvFAtPjATJH0dj9hr1C+yVPo4G
X-Gm-Gg: AYBFou0iPesFDIhJhMuNJzVm/zLG2oZuEmusCXgfOM9A2+kC8B5BN0T6uSbvv8/8/mo
	d8vasCjAeLP4Qin+OEKbgScMUuW2H56OpmslgeRRoHa42grzHawhIDHIMs5KwWCJwcS+6vIPKwl
	swjEX0lVxpQeCpxtkEImvH+j5xsJF8PZx/DCU31fGE57WKmfxca9oepzo2PdleEWgu5D9LVe0t+
	OCUfmQ3Pgu6Y5dQMkgo7R7Zj2r7VWQ1yyeAJbsSLCNpwrXscJxXYGGMXS0X2n9TJ7jhti/kdtoE
	Nqa++lqwpFBCImKAN3+9L9nsDgjJiZUH/e4pQIcyXFp7ryIU04hAnmZV7hR68rYpRHmHAGvTnFs
	TMCxeVhL78uE7RL4zFQXvQC8EL86MKMAq5sIa4DA82rzgy/1ukh3hR5XrW+M9
X-Received: by 2002:a05:6808:1314:b0:4e8:5ba:8809 with SMTP id 5614622812f47-4e805ba8a21mr9177519b6e.26.1790689367059;
        Tue, 29 Sep 2026 06:42:47 -0700 (PDT)
X-Received: by 2002:a05:6808:1314:b0:4e8:5ba:8809 with SMTP id 5614622812f47-4e805ba8a21mr9177485b6e.26.1790689366517;
        Tue, 29 Sep 2026 06:42:46 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbd3520c1sm4151760b6e.17.2026.09.29.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:42:45 -0700 (PDT)
Message-ID: <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 06:42:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX/A+3wcOZ0QxQ
 qv5+wSxYddHjrKZnxBrXAjBtiQ72dhYR/WVvjKugnqsRSXPzchjibYho3f70L3k1ZJZ66E9VrUp
 K3ndwGsNOCdE2TjxmgOC0bWC/sCCrq8=
X-Proofpoint-GUID: yKi6NBsSqREmx7vE_HasgH4MhdMYi4VG
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbc057 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FeBjiSnNOcrKIJN5QMIA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: yKi6NBsSqREmx7vE_HasgH4MhdMYi4VG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX30fyJSCFCz+Q
 RXzyc+O0RTpuV1HyrnJGw1lyKT4d3zLzUCVWBm6WEQnjf0BRt4TTFYw8Mc+UkzaCyvQVIQFMusQ
 OBV4XfRzxKZxbSGxW4M0wqOX3J+177oM/lYh137ECcZTFbaTXD7Jv9cq4Z48FrBJpSFUsd+5rGZ
 IZSJm8Dua6VkGlX2IQFu57RAPdBivmoUa2gEEECbSJRDvyGK9dtaL7MBdEEMFrACllvuqCbbYx+
 p2H2vQF3wAdZRSTEhubV10wf2u12CtbkkVvNMJ0t7PF4gFq4aB19p04Vfu9kAHKlhOpKjI6HeTv
 O+2Ukg1DR5ah+mj1N4w+18qaByKYsJh36c5s+/6rgMHAGQBZcNMIqcHvcDnGSe/UkeAzEFy9mzu
 JW6vmQH7uvzuXQgY9gYQMRcl4J8rwHKn3Ubk13+UxmgfcVjJrPjgpRH7QMX0a5Zj1Nl6lAKd7ju
 nuEusZ46UEYJI4yYXeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_064248_791739_D27A22CC 
X-CRM114-Status: GOOD (  15.76  )
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

On 9/15/2026 1:00 AM, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
>     wlP4p1s0: failed to insert STA entry for the AP (error -17)
> 
> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
> 
> Also, there is another error path in ath12k_mac_op_sta_state() that
> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
> undoing the assignment through ath12k_mac_free_unassign_link_sta().
> As a result, the link RCU pointer remains assigned and a stale bit is
> left in ahsta->links_map, which can trigger the same -EEXIST failure
> on subsequent reconnect attempts. Fix this by redirecting that error
> path to free_unassign_link instead.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---

Baochen has a more holistic approach to this problem in the works, so dropping
this patch.

/jeff


