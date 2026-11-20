Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FEB606A33D
	for <ath12k@archiver.kernel.org>; Fri, 20 Nov 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKT43azX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwQDXvg0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=job7rDcZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=; b=qKT43azXzZANtN
	XNmUCeeptva6QR5UPmrKscMkSDCGItTgyqPRioBbNwrPgANA0k63yemK0cGptmAng93TVi6t7XiV+
	xQkBRZT5SWxWJcRu98jZ5Q+rA3g3+UMvTFf3iIWoLP2UgcFNk9FQrXMy+rh+8iE09SJ/r0qIJQxgp
	FzgX8Oll9v3nK/3FR1n+cu8UQ8e7b1FD1j9H7pBQF2GygBFwVHTAkVXBhxnOJ08tzRgfjWmRLD0n1
	Dzx8KHEUCPMlcKRim0XkB9CghTWKw2CNxh3BVGwcfk2P7BNnQ1SdWKY8yVJh+Oek3nI1Fak5kuhVY
	f066QZo8rk+t5URpn0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOdP-0000000F5oF-39Fa;
	Fri, 20 Nov 2026 13:26:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOdM-0000000F5nd-2X2n
	for ath12k@lists.infradead.org;
	Fri, 20 Nov 2026 13:26:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjolG1462867
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=; b=CwQDXvg0LyggqihZ
	EyN2KmQUQhw66VZ49OxeSUVN/TqOt0ZcSx1f4gw0PY0q/82LuDcuVE8jqPBvul0b
	uiQcuGiqbpfRauwwMXlrUw2SkkRLVsG4sorz7h4dkXE61+eRxRPAHqNJYrGR0J27
	d+5Yu67PRZB9GCq61m1Z4iaGbS3IFPDSolYr4FGizg25R94HAHf+aGInvtNklSUX
	wLELFTcMXE3CUv/b9bPYsXpZiKmFsPlJ7YZ8nDvFxyum02NxmPB0cdBXJ7JaiVBd
	EhHvwRlyEIxinHhX2NPr74fyN324/jh+Pb714TwlMqUSUEeyKjfGIW7P0KE3WxRm
	0dEFQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahpw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 13:26:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso1158156eec.0
        for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 05:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181190; x=1795785990; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=;
        b=job7rDcZxF108G+lWgYtl/gDeXKH4IGlFpbA21THfvQE6RSJSttEP4JZna+HWiMUqu
         kQna6aW2OA4YLFIviv2Qa7mOzGmyvNCoavPNJn6kBvjSEMqWmgcVpehdEZ2e2Du4uSQ4
         o5IywSOihTynSjk5Wty2QGyjj3HnBPCSw/8MOV1zpo9Uk0vARCFV4Bpg0NeAbgxn1Hju
         elYCVKVcLxIGvsq0vPSFsEpvzN+1smYQl4sLMN9F97qn2jD9oiwibvXZu85L579rLLKu
         zA90nLz0M7uYG5eHcTEF005RLbwFT4TLy8ve03TDzVTk3BxPoO6Y2+4YNtun23Ib//nP
         3Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181190; x=1795785990;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=;
        b=20SdYOQUJse9hXH/d2IOyu1Qjm2B5vb4iew2NppEvfJMEG5eDPY8ANyK/LHdE2E7yp
         B+Hb7apk1gIodCp7M5tNuaMiAARzVN9kQ+8yLhlkssz/munp3IHjDB/ptW04IkvkLPTJ
         CjHRAJi7rNf5pgLGG4bLtmGmNpUG7AgT105ej7oE6bgSaa39kUc6J5FYKoJ/exerzAEc
         A5Hc6BTdBZykThHLM9xq+YBgob5BuclDZYFozceXG8OY2BzN/6R9AwPSRRZnU/VOZ2C0
         Psw/8IMO8bzMdxWI2vd9iR9w9W4tVZwIUa4snW5GAU0d6v0d3aNRqSVVEJuM2fuHNlPu
         q+EA==
X-Forwarded-Encrypted: i=1; AL+hErGlJ/+oH3VvhlzWJZMecv3FJ4XtIcXsD5J3RHMCRh9ZB0PxyjZx5aO/F2d2LX1FhtEX1G5mr98=@lists.infradead.org
X-Gm-Message-State: APuU4Z9az/q24ZtlLbsmiU7oHHO1KzCdtxmjvwlaVflkpR76kaNz7z+w
	3ghtCEyMe75CH+fW3Z2vKhEXwOUeSh0WCZDnmCSTucGd3M+JCUX1zFvSyMk/WxhtdQ2H7E0Ugft
	WgfiYxVfG54+mDWDyfByUhxVMx2fiW/qHXa+ShWc2dAzeoiQdi1pRd1QXX8QkbGXJFXB70pZo
X-Gm-Gg: AZFdTZf3STNP6RHw0azzGtMrD6rdoL1cpVZV0fNdW7vLzX5KtIAfEWQJfPDlJkoj4au
	AvHD0gMlmPg3Vda/qfFixGKz63UwC+mUBCWKG14rjWLrxTHI028OxCp6kbJ1lDCozca2vpu1T7z
	Rw+E6f89OPW2l9HxahMjDDKn+aT+53lXtc0Ah0bNVCjeN8/eWTpHOF/Gsoc0WxJe6oR2NJXzTiO
	4jM7oCVecPJWDelQEQOzQipekEhRlgZ0MXHjlU+zxxx/0oQ4PtcjV3bb3mDHb+zr51EdHogK8GK
	Gx2nMmPnGMI5yPWGs5YZ9xKIxATXzcSaUbcjubVvo3k68tGY3v1Z9aj6ccvE30nky3ngIJNygqh
	BtZIGBUKxX9xwH8ATwbabBm9RzhcXCv+czXFNVfPOup5JV9NnEnRCisMO41c+ymhxVMZMutwmBe
	0JZtS9MnoWgV/dmCBD
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr2562922eec.31.1795181190023;
        Fri, 20 Nov 2026 05:26:30 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr2562890eec.31.1795181189475;
        Fri, 20 Nov 2026 05:26:29 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9479753eec.28.2026.11.20.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:26:29 -0800 (PST)
Message-ID: <6c91ec31-d17b-4ab1-9031-f61932c57dfa@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:56:24 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: report TX status for broadcast
 and multicast frames
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20261116230250.369383-2-ivitro@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116230250.369383-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXwzNRKqAdLBrE
 YIwfeYB076CDw+g7RMBh1nnqyFOCV9krzNyMjN1OIrZczot3of4FI2DHs6zmGMXXVpXzz6O1GAC
 IzUij7O7M9COABGkLcr6QA5Di4vhT5V6vyFZ24DhLM3JZa0elL07v44hXt7G4mhfvOAqNWf11Iw
 G/aSoyBgzeZCrWKfZ9sqpGOVRZ/fU86AH/R53u17WS33gZKihcfveY5HRy3+pGaUXzHwcSzuDfW
 DjAodguOXWLgUjWGmfAxcgp/KDrvscunXZ0WnvJn5zrrfc/Bng4m2s07w5yn2OtqZ7T/fgqrcim
 L/DyzB/oBerO8jxqzWrtXc1jGl/lBgZnU2Z/1hXvzlFu17cDB0+o+L99u5ovRt/IEzFaX7hfPyJ
 U1EVQRV0+8tkBvlnZoGNkZVnyDBOzdIYFA0+clE9ALxn7VeWoW3C4Nedw1SPFSD41uWAIY2H2Mj
 q04tL3Yv/RZD6bBVvxg==
X-Proofpoint-ORIG-GUID: 7cSAaXga9gkdezBm2u20czh7HusyEo3c
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004a86 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m8ToADvmAAAA:8 a=5RRWBY4WAAAA:8 a=bIduEeDIxUt9zr8lqoUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=kCrBFHLFDAq2jDEeoMj9:22 a=drtMOSl5Q_Tsf-UZi3mY:22
X-Proofpoint-GUID: 7cSAaXga9gkdezBm2u20czh7HusyEo3c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX5iAtBUJGBMgH
 +ctHGsN11h4EOijj3ltAA9E+CY4pJM8gq7DfHKghaSDRCpsA0eV/YhlQQRabVGCzeX3Adu9zebg
 dP2NORepc7TuzwGix0ws4WgxVWmD9xo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_052632_684642_13D3E66F 
X-CRM114-Status: GOOD (  20.91  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/2026 4:32 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> In AP mode, once a station is associated, broadcast and multicast frames
> sent by the AP log:
> 
>    ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2
> 
> These frames complete against the AP's own peer. That peer has no
> station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
> reporting to mac80211 when offload is enabled") a missing station is
> treated as a missing peer: the frame is dropped and an error is logged.
> Before that commit, the TX status of these frames was reported without a
> station.
> 
> Report the TX status without a station when the peer has none, and add
> rate information only when a station is present. Only drop the frame
> when the peer is not found, and log that case at debug level, as the
> HTT completion path does.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
> only in dp_peer") in ath-next; the resolution uses
> ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.
> 
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 23 +++++++++++--------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index 41abf1865702..794d85d9dbaf 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -856,24 +856,27 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
>   	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
>   
>   	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
> -	if (!peer || !peer->sta) {
> -		ath12k_err(ab,
> +	if (!peer) {
> +		ath12k_dbg(ab, ATH12K_DBG_DATA,
>   			   "dp_tx: failed to find the peer with peer_id %d\n",
>   			   ts->peer_id);

I'd still keep this in ath12k_err to catch the frames that get TX 
completion without a valid peer.

>   		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
>   		goto exit;
>   	}
>   
> -	status.sta = peer->sta;
> -	status.info = info;
> -	status.skb = msdu;
> -	rate = peer->last_txrate;
> +	if (peer->sta) {
> +		status.sta = peer->sta;
> +		rate = peer->last_txrate;
>   
> -	status_rate.rate_idx = rate;
> -	status_rate.try_count = 1;
> +		status_rate.rate_idx = rate;
> +		status_rate.try_count = 1;
>   
> -	status.rates = &status_rate;
> -	status.n_rates = 1;
> +		status.rates = &status_rate;
> +		status.n_rates = 1;
> +	}
> +
> +	status.info = info;
> +	status.skb = msdu;
>   	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
>   
>   exit:


-- 
Ramesh

