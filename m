Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8375BCA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAFxtCFAGkhf5HjW2o1fYPliXJnjW5EUi91jOMKfn28=; b=ij9h4p5B769dVmy32rvUuYU0r5
	m0V48FXqxR1c42zEN8EhDWoM3eWTS8/1vZ+hqcSD4+xjkLp1QL+ye8/MhGnjnNm/atPVaycSr7A/0
	3acUhkHekeN0XZ05trCFaA+ixPFwlDiN5szilRTfq6OUN2qYrsGba8PuO0kBqK5uxDeCNnTEreIuM
	H5skfLVYtgXYqHL4ZSLsHviTVay7d0SbRpSXo1GZMQWfzmh8SYHeg4uzYSMMK8disoawWEFP3pT1c
	WV1YNAreHahoesmlSao+8KONYDxCV/Ol9JSyfmOKjgapqZuQx1hCF77+yywn39AY2u8oMD47CafPo
	K8Oo0DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7El-00000009d3x-2UCA;
	Mon, 12 Oct 2026 04:02:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7Ei-00000009d3U-3kBt
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 04:02:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lJQw4078232
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAFxtCFAGkhf5HjW2o1fYPliXJnjW5EUi91jOMKfn28=; b=dlmBQO3WNOJdbmS8
	7HXQAvakbNMpJSlpyE8IeYW3rBxJ57K8SmrJnnDDPGMYR0iPqgy6R+1rcWnJz+p4
	28FcKNyGEuro/pFz6cv55zlSpn0Lt9Z5Q5LkKAWaem6lSQ53Dy+44jMVfUFQtvlV
	gQfKF2OSWmircSjetdquf7RcEjDchfK49QSn9pvlg+92HgGHpotuMdO2EcEpR3Oq
	l1DBeHEjm6PPHVBKxyV5Oopt74985dOocDnaFa2YkCnjH7ZwELbHjepws9hXP1Ca
	wzi4LXVMQus88qFZjpE43JbQXwH9/YqvVZhZyYCRdQRPaU795txz952P3mBjcWZw
	IDFxhw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dgth6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:02:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1249598eec.0
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 21:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791777721; x=1792382521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAFxtCFAGkhf5HjW2o1fYPliXJnjW5EUi91jOMKfn28=;
        b=jlEHvRUE2NM8TxLjeW4uZz93DsYX2DEkQLGDg80do9ni7ROZEjmIDdLIOjVemyBe81
         gWKNOHjvfTaNERV2QftepPytG01s1A4kpvvShOp4cgpSNktVJr9FfUuaLA9hicIrMS5r
         oHGRteFFDht1hU826OQ/lpd8IxN5SLxI6HE4kiCfmzHRqju9TeRGm/P7HXd9AMJ2uO9a
         cvLvLF0iBTh0qsMy2HCAHzY/t3TvyfB7hqleoghYPf/lZf/KnVDsWctHfKhwM6VCxBUN
         lewphvllZ9DEyst2g5iPtqYgrhRppRINR7TTA7zgH8MFuDcXpHm0R7H7laFVMbP0p9dx
         Pxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791777721; x=1792382521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAFxtCFAGkhf5HjW2o1fYPliXJnjW5EUi91jOMKfn28=;
        b=wR1K39IyKA2Yr72xu1ECzZjtC3HThHXWOmpmzwFN/wsBY2TBA/bnaAaktXpVlxZ6E3
         Utnh1HQkodyd6gnZOfY3JpUqe1xKYkdv8eqfegPIE39l+ATBjhYAkx9ErEh5I+CLpelc
         C7KOUSGQFXKeilrEOF2L/ZlsVzpPGQRmvSOS6CODO2zpRYSRtdphaWEbg6kqhT438q8+
         D1eyqb/0WcJ93onDtqFCZyemUQtVPWoaPL24SlNTyodRAYLXn7y1XGrgIC1YWJWilr40
         Lj1GPhveJFq/XZ9ECmDswlRmn9vx5zPUrb75WckcX/EIn9C/Fuoc6oNZLQQbi4pnJHTx
         f1Dw==
X-Gm-Message-State: AFq9FYJRLlWPukdM4TTSOVaXCUgir/b/WqVIDWj94eV0ms6vs9CcMhUF
	SfjN1EKXHyFfSNT6mKGovi7jk8DcjOPaYg4EiTiSO3t6ePMGtVAvPo0DpCYjGGRZDL3fVqodRBI
	jNBjWXMbIGosGrnYXAFRlalKMu+irkgsBzPXocU3TvLV2fCLEIidKjbeb+a3ErTa4XI/Jxv+D
X-Gm-Gg: AYBFou3Rmi2oi0GR/+0P6/MofLcuCVZg1LTxV8otmy3Dy1BUTHIQ8yXLfVZ6lIyYKeQ
	XmKBOzSy2jVGJGNUakSN3CZ3ZBuHW4Icb6uUntrMEaw0NNt0s1hGc+WAiay6DrD5Gx1ZlUi21fm
	zGR0nlNyZii++An6u8MCcemdajiHdw3YkZY8V5vboP1PjP7QVp1Yc2+Aor1arxdakCiMeDrdTkU
	8DeWGG3Os2sEx0QV4Nj/0xpiKp2LrVVnjPcyzoP7VoRE72xsyaxCFI3tZwL5C76nhl0wrq7TMsD
	0pOrDg2YXRWJLspOG0v3159BmO7n/yoXcn4+h2n8dP8bka+qFlmZR+ut+gvFICAbM+DWVUJw61R
	sFoVD3XaRs4oe87pa1DvOzkbHs9rV
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr1618223eec.28.1791777720861;
        Sun, 11 Oct 2026 21:02:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr1618182eec.28.1791777720174;
        Sun, 11 Oct 2026 21:02:00 -0700 (PDT)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm2387933eec.11.2026.10.11.21.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 21:01:59 -0700 (PDT)
Message-ID: <4a66d34b-e752-48a7-87e5-8a189532941f@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:31:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxNSBTYWx0ZWRfX2CORvsHr8PLk
 NKBZRAid3mg8ycSlcNkSGM12XtPvk6Nx0FVvv+keD1k2nnDsxckImeN7AC7uVgeHKi0jRERaKnf
 f6nmKntH8UYcvdiG0LR7VWVKJAwbSdHbB3Gx+5ukie+TN5hXCANYALOKN0Snk2EcEul9Sq+4Y1c
 w8T8Y9CLHKeg6Wh+stmCMLdlnkrgsHnOfgb8EZ95sYq+68fwxDa1Q/FQM4zC9+H3yXRwtXDZk2d
 BMs78W+5/4ETId+li4fAKK2LOw2/18GW+UUPMWW3hUtqmW7NZud198gdDjvi9B3pXoLFAlIutQ3
 5cKZZO2i801hqIpfSG+d64OEX4EtcAH1aol2o0NVn7nzkfJwqvlhW7iS17xySKFFjCKxLGKmvBc
 YNAw2nXcNnEo3eRHDqv6wMwnxtemN61ShUcAeVChZ4RrD2KAfKByREwXuVzdGddcJ/n6XDIP+Ig
 Bk6IiE31p/9YJtP3C4g==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc5bba cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FAEhTdbA7TVx68QRkYkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xdLS6dW7h51P1A13aLGfmPcQGWQJJdfP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxNSBTYWx0ZWRfX1XvrBswQb2Lq
 99jkRLvz/BPjP8k2aIwayiMfuYPtxr4XoGUi8sRvKqoY4dKI09KvOZYRUi4147M3MGt5G0+EGlr
 g3Y/Q8GCbXrc+ysiL1zvCYXTgC7LK4I=
X-Proofpoint-ORIG-GUID: xdLS6dW7h51P1A13aLGfmPcQGWQJJdfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_210205_096619_0775EEB3 
X-CRM114-Status: GOOD (  14.39  )
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



On 9/25/2026 10:40 AM, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
>    * Store the station pointer only in ath12k_dp_peer.
>    * Store authorization state only in ath12k_sta.
> 
> Doing so eliminates duplicated state, reduces bookkeeping required when
> the state changes, and makes the ownership model clearer.
> 
> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
> updates users to retrieve it through ath12k_dp_peer.
> 
> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
> updates authorization handling accordingly.
> 
> ---
> Changes in v2:
> - Rebased the changes
> ---
> Aishwarya R (2):
>    wifi: ath12k: store station pointer only in dp_peer
>    wifi: ath12k: move is_authorized flag to ath12k_sta
> 
>   drivers/net/wireless/ath/ath12k/core.h        |  2 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
>   drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
>   drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
>   drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
>   drivers/net/wireless/ath/ath12k/peer.c        |  2 -
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
>   9 files changed, 35 insertions(+), 83 deletions(-)
> 
> base-commit: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


