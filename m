Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8E606A31A
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D2WBrEmv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MKuSlqOr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QX6IVmPT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=; b=D2WBrEmvVfUs7APwOy9tsJoeDi
	7jULGOiSMspoF+gt9vjBOJnZfEBeIO3Cwwa/pmDhUU43VNWnbBwIBYm5s2GpXzCu60oQb1xd5RzDz
	LP57Q4EE46AqYk2nzAE1hGQpX6qwTehRV/TbOz2K2MiGV0/R40YnZBJYevD1N6skyayRGj1lizO45
	f9HX2IPU+LBNyfesv41IvrXXySLpAZi9HTS0wxGTA+58DmxxZ9v3DCwXBJYZlOGB4eeUOKu34x8We
	o8UQ/w6xsCD4IVca+dyVrTz9NxOGDuAYBJalDumhyhVM2SmTPG0s37xNkhgtenN/vSVTYYXsInLia
	6/E+eqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5ar-00000009ERF-0skw;
	Tue, 20 Oct 2026 08:53:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5ao-00000009EQG-2jLX
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 08:53:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8XVTV1211310
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 08:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WlvSUhy9NQS9KPGPiYSnQtbj
	1YWbn4EqiF+2amxYei8=; b=MKuSlqOr1MM+K2c3lV9aBkreZDdS+7X4gg6fZ7xQ
	A3gWp1J04TcSKHo+Cqivfr9CyaNl/XGsYxZtmGs74g/OSbe2DmeTqV6mDHWMrV1h
	6rHKhKDpWzlJ5VTfc862Lf72+YY/0DRjkyx7KsgCUPOu3gyNk1UBxe9dX53rHZRS
	z9YYngdReEEG0BInhvyP0dFVSToeL056kSdQ7EGcd2gb3jP2hkDqcvnudKi+LJ0i
	OyC/Sd8oXiNVqohNxM86OyNWZ9mhzbyQN8+U192dhoXlAoByYewQ7FQ7NQIPNTge
	UtrOthe5bkp+PLTtilB1lsM7q7qr1Hd5qkg+3Dp9mYVuFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1qf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 08:53:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so8498680eec.1
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486389; x=1793091189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=;
        b=QX6IVmPTX/Qj320uXQLP8U9fsL1yebvaKD/IawDhsX4eI/3ykHts1BQusoiO75RA9n
         Mz+9/IAUxs/7cXrVJzxDS5LHWlS8FRap+2lxZ7qEpEmU0wL+tXnmiSDXPPRvGKPrXaFc
         5jd36K6N//yzr2uQQo9vSYZOsq3+IumWilX9VoZXmysjdokFOJUSjNtj61BsR1ye+CK/
         QiwvJlCIMclHlmclUi/2oGkaa3u6f+htyZW9rzBDPpykmAY3MnxVjtVWFmjFFnga5hje
         sT0drbJMGpKq1clXn5gpxijSN+KQcbb8637EPXUhTcoUnNhk6hmlaSPrGMkHeU1PFFZ1
         hUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486389; x=1793091189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=;
        b=vEfmtOZL8Gl5rs4dptWBHSqJAAp2VMCgGEVn/FVNCsOxrkveiaZRWNql8Xv8guQMWl
         CyOIM9ms3siOYBNDMBWweWA5ApdffOlQQ5wVJxyOBwH0nKoe7gRipDuIBI8989InY63+
         iENIyH8Qx/hoDqcnOwDXcibgtLV2bVtvY7gEGNw3HWf2IdIkcjfUAehXDRFninsWC2kq
         spwBc6sge/7Dc41jaHyGN4SnlT1UWdzSRjztW1LEuIr/fn30mUW2Tz6XthnUTVRjEVJg
         U518/IWZZygFFZy5E5Z31Mv+cASHDMH/aRFMDz5HJnPQPvmDV1erTBlA0iXH9QX108Jf
         owYA==
X-Gm-Message-State: AFq9FYLrg1Qzrv55R3f5WnBWcJrN2RcIA1ld6vBnaSugP7MA02EeJlx4
	jSUt7mcN55AYwSuRBrpSy4/TQldHMUHrjCwTxV1ci712txzj8/8fOCvZB6cLTzSM9BnTBwXVVSn
	ja1CkGjmKyir5VAnBPXdh5qjD+VNeGs856Cm9PqvYXBsrhd2baf6sT5jTefEHgPix
X-Gm-Gg: AYBFou0D7vIFbDmj/2U754tHzpdeRFUuXCjcpqN1QlazLbqeIMOsHDC7jTeWQHiBtVl
	qkss7x5nDMSds7th62w4mA+w2DlQUpIi7lNNJimTpjXBkI4k0P7XjFwdZU7xCFMJLKluy52mIhZ
	VjdS5VDBV18RyaSQ/3D/IGV5REbav6XwA4daaLpxqUSHdrmu7iTRoS7DkQbiLsj9KOaqYxx4u7n
	o0dKftan6QUi9vQ+v/MwFYTWOXrIHG9VHSGnBtjEHxfEz5/6v1membhS343s39tZpBxeQ1xxDll
	kfSI8Vn4l5s0oDy6EkfFjTqhqF2/le2qCN6D3l/NifB9gfto1kUerxAZWZTZL5ri6AN59a7OGtB
	rVKu5H30dI6MRDHztMjzT9fLgN4SmCSvYE3PXme62Wg==
X-Received: by 2002:a05:693c:6081:b0:35c:4800:4da with SMTP id 5a478bee46e88-361a2c36c2bmr15915710eec.41.1792486388789;
        Tue, 20 Oct 2026 01:53:08 -0700 (PDT)
X-Received: by 2002:a05:693c:6081:b0:35c:4800:4da with SMTP id 5a478bee46e88-361a2c36c2bmr15915675eec.41.1792486388216;
        Tue, 20 Oct 2026 01:53:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm44011807eec.27.2026.10.20.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:53:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:53:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0l9_aEYidSIac48szo8vqDwANX0Sg0n9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX9XX6vvzsC6KV
 eKjSmqOtRmuKg/rJ7TiM/K5KFKCQe5Syux7JJAu2c9QIpQrhzFOvSP/ddWCJ9jlk1gdHXEAfFnh
 zrc+u8HbQuLBEKTjRl6QaV6NC+oFm0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX5U6pNX2jf1WJ
 5jD+1TbMbwkg7KKWq1NPetkHoENSich6T6K5o8BK063ThYkJ2xp/oiOFaNSaVSsXkZy/gEOEKOK
 yelfrO4McBRPWpN0aus8b72BpDhA4GzqCM1iU6K0Q5LgHYEm+En0E7ydetLEa4T5AX4Bl81z8+D
 gN7ewC6/3MAz0IfUzqrG6r5Pf5axCsJLFudC1PXcP26BwATSuq5D46ohEOPlLC/kVL/KERA+4+7
 TzV7EbuvK9nNtw+RHst/LQP5XeBjUjT0YQjkx2R1j0WOG7ZvRBlScTKKQKUG6XJPRHY0eIi8YfQ
 o0V86FOBUOJm7tLIZFM2GGjCxg6ZHxgFXa21p5E4Bvgv1eqtzpnyKRd3rXm0Np/BAEiBA5YVXBo
 MehgKY/anBWAGkyv1RsWO4Vntz03PSCaVxEYiKTdYDPVaMsSo4FjZ+2ZQYvK/YiJNpFeG2RKR/+
 +qNF8Fegm0QouhKu8uQ==
X-Proofpoint-GUID: 0l9_aEYidSIac48szo8vqDwANX0Sg0n9
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad72bf5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2JoaeQ_52KTGIJA8Ts4A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_015310_705702_5BCEB8EA 
X-CRM114-Status: GOOD (  22.30  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+ linux-arm-msm

On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> For WCN7850, MAC buffer ring size is updated to 2048 in
> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> to increase peak throughput.
> 
> But during the RX process, a phenomenon can still be observed where
> the throughput drops by about 30% from its peak value and then recovers,
> and this behavior repeats during RX.
> 
> After increasing MAC buffer ring size to 4096, the data rate drop has
> gone.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

FYI, in case someone else runs into this: with this change (merged in
v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
working with the older firmware that Debian trixie still ships
(firmware-atheros 20250410-2):

  WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Probe and firmware download succeed, but every WMI command times out
once the interface is brought up:

  ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
  ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
  ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11

Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
reverting it on v7.3 brings WiFi back with the old firmware.

Unmodified v7.3 works fine after updating to the current linux-firmware
image:

  WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

On Debian trixie that one is available from trixie-backports
(firmware-atheros 20260916-1~bpo13+1).

So nothing needs fixing on the driver side. I'm just leaving this here
so that anyone who sees "wmi command ... timeout" on WCN7850 after a
kernel upgrade knows to update the firmware first.

Thanks,
Shawn

> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..6596089d4168 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -205,7 +205,7 @@ struct ath12k_pdev_dp {
>  #define DP_REO_CMD_RING_SIZE		256
>  #define DP_REO_STATUS_RING_SIZE		2048
>  #define DP_RXDMA_BUF_RING_SIZE		4096
> -#define DP_RX_MAC_BUF_RING_SIZE		2048
> +#define DP_RX_MAC_BUF_RING_SIZE		4096
>  #define DP_RXDMA_REFILL_RING_SIZE	2048
>  #define DP_RXDMA_ERR_DST_RING_SIZE	1024
>  #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
> -- 
> base-commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27

