Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683B606A325
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 21:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNH+6LNF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oj8jMXMH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bwz6bf4m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=; b=yNH+6LNFS596C4
	mDxA8ZQkA5syEezFEDUpAwgFYBp7aSd77MFg23i8nUWN2FztnjWrvSSPKcXESuSkXtaiGcZhRk++y
	fr+oF8wBSUIMTvUTSGCUWpJ72db8LBnGuobddY5bu1y/xNcqYQMhvzjnI7Kq1/B84JRcJNRCxN9KQ
	UIS/sNoAuDq4Izz81Dg8q07R88xmp7kGUaes1mNw8QGZEynPw7NzEMaabwe3yl/mBpCr3+WVQXa9J
	WPL9IhByAfIHeKW0b77MsfF7vXqPlFr/Mjbn2fuNo86zQdb/TRMnKNHtGZFbWys8VB3ksmBrhSR8x
	IqCCy26EUW5JnartE7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6v-00000001nUL-12BD;
	Mon, 09 Nov 2026 21:41:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6q-00000001nTu-1vm8
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 21:41:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAGYZ1352200
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 21:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=; b=oj8jMXMHdDyXx0J6
	Ij9Jxh437huewYEuL2L43gSDEvInLikDx63uTn4LjmUCgQeM3QIeQpCdJdpWBunO
	yRg4xoTNew49haIlrReKrss5HJqOC5V2Ht03w83tJ7Jt6a98QrDETWwWuk5BFC6b
	hzcf+MnwsegeNphqnN1LsN0Gu/1quCnrortxm6FqYmlqMA/Zh0QR459JvP//uqKI
	RzlW+1E4Ne6R9Q0s08w84LOKV6bEQ2f8PMW7/UKOiOcgLtTol6i5Q2j/fTWxD9fO
	UX9q5wdpwA6RksaCa7U4yN5wDBxnL8vbPV4RmrAer2hGRY9Zkfft0Zq6HmrUsRpK
	1587lg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapac5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 21:40:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1947220eec.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 13:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260459; x=1794865259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=;
        b=bwz6bf4mm/nx8q7ClWamlc6WKbmHKzgg3BJP0VpUyETR/mJqKlUlGkoYjzJ4x19F95
         0xy56DX5UwkBjViedfiZny+oeYgXji7whkPERWrA57cuVF/A1xkFwhTU0hVUIS/CdIIA
         lBYo73YgyRrEn8dVFTMxEc76CkTFpkZ4flJ0VnNDEbbZ8mzcRC4iWmBBOtp1Faf0TAzW
         Ppy79LlWfk1OmOJ9KLxw40cTt4ksDKeyhOhyOIKDMokFhHqy7mWVXzQ1LIbfGd1hVm4k
         E8dmiCpmuThVaCjJf83youWh0vAiHc367LT6O8mrav1sbM/ygnx1jDaL1phJGeU7cri7
         xsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260459; x=1794865259;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=;
        b=K6Zz5A+S4dBH5b959+6PMRiXckUTVhvHWceNYiF/ivwmyd4AEm6mYON+Fb8MtcL3Af
         KayU/4PYSaNYpiFV6CAYUhCtLsgVERLCIRMAN13cjiizTUpMLpMw2nkT59a+Cq4m29bR
         q+79+yUCm+7r4HdDDUndJ/7codiT62hjRFuoprI09lta4kD5FY1/kDOsu06wjfsKD5ML
         ANzC6wQ1dxG6FhTNd0q5VGTW5dDwIiPM+cggN7tf2WbjVqTNx5uGnPn+t8V5MgTWQTod
         nhRrpjKLYY6WAb6tvsMSf6XJnvyBI2VnTe6OC7KFmeIDTUPOpYOJdqxMHn4txXMiTSff
         lpJw==
X-Gm-Message-State: APuU4Z9lbsmqO8vBoIpwIXYWBI5v9wdT6QrfO8gzPdGD7o5C3tAu9/hk
	hM1E8r+j/wU7NYinBRi1XgZA6UcBHgWHD+PDdnlAEFUj/ZCGrKMH12o2hLO1htv2vgQPD9HTQ69
	Gquinr8JXSDCOierPf/Pulbn7wf8NfSvik0mCpc+X7a2RkOG5ZPLAv00n8OZxfl7+9mmL3Wlg
X-Gm-Gg: AYBFou3g+KTpV8OlzHt/Nd6qqdLOacz5fviLMe1UaXNl3DbxBqN10OZasjchPQ7Xw+a
	DvdDYfDB6xDgSV3wU+H5Q0FaZqx+NbSpzsWQY9Ml4whD48garACYnsXz4CbhBJJZcgpwDiobyqh
	nhsCBPzbL0YVaNSmZf9ZKAP7kMypJAtVuOivRrqHMlYEjge5OwZnyc74AAiAIg1N+Vd6KEY1YOx
	GYRvkRK2qGnvA1Q3O2fSvkSknL+tqEpe6/RhNbalhvqDusE+GuaST6gl8918bjuMkFlRUon47Ye
	budJv8JRBc0PA+Gwc6ps/Uwx6PQ25qQPZIHQiLsDdmu/yzz81e1DTg0XG19QHOb+gmRY3tLUa+C
	hygikCwYRSd8NNzTeSQxzDUJyDPLcgCmWfnlCUyh6ywuD1jJbbbKly+J+woro2mxlJQ+obMMfqk
	NjCCRUo9yOjAmIvoFb9Gx4/ONYfMQ=
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745051eec.33.1794260458547;
        Mon, 09 Nov 2026 13:40:58 -0800 (PST)
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr744999eec.33.1794260457688;
        Mon, 09 Nov 2026 13:40:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:40:56 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
References: <20261030090906.298234-1-jtornosm@redhat.com>
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start
 index of 80_3 segment
Message-Id: <179426045625.3811579.10660215408027354985.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:40:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXxHOmRnh5NbkN
 /cdDrfRGWnqcg3dZ5RF/PyRQOBuOnvJHMqk9yBhC8LEVv21ExPs2r6Az2SpAAaaYlKkRh6KCuFx
 7XW6y2HvVez3O5pob0POG3h52+EfbVHbqBqrkPX/qn5StyHiv/CbSvCc7iRYGNi9klmfg23Afy/
 2K6gSxO0LvVrhC20IqEiX4NQEaRzdwtO74DlhuFp16wOJdgFL4mkxBq6F72v8C3AL3waHBMRgTj
 p/p5c8bgcq9bRDpVwp7XhbZIwTEYkxvNNg9pcMkQt4T75wWn7SFx5vFKGnYXKpbkTu+Za+yayX2
 WXBC3PZXw6Z429VHFfiSclLNVaomseXUdsr2fw/6hHKgH1Ebg83i6FjwTcM53L7ugraQmAktGOt
 wLKltq/7nKc4ubm2QRdc6cDawp0ovBj8TvVW9a+9FyedbgLuwcV6kygwpdKFF6zaHjomrp8ShJF
 LsxqNxwLrl6W2Evs9eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXzMKucM3mmRkP
 E1MDVIuxMyhemrjB+4Mg+13tPUzseb7U5CZz30jFciNHpOyk5wyMN3TUjZLkQ0u5nG0iFDoz0G8
 hninuH+CHxl4i8HPUDxSX6GTVCj497A=
X-Proofpoint-ORIG-GUID: c1qV4U7rH6vEhxJCjDATnfxgkx_RS_ov
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af23deb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: c1qV4U7rH6vEhxJCjDATnfxgkx_RS_ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_134100_520498_F198A33B 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 30 Oct 2026 10:09:06 +0100, Jose Ignacio Tornos Martinez wrote:
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
> 
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix wrong register read for RU start index of 80_3 segment
      commit: e49c1be5860334976e485777b97991aae9b4e8c7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


