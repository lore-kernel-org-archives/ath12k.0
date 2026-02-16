Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203CFE81A3A
	for <ath12k@archiver.kernel.org>; Mon, 16 Feb 2026 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7taZpAF2X8Fd+m136ce6Wg1a9z2ZEYN8WTnpMSmQO+M=; b=oGBkFsRW+2aXUARzUVJmJ79s7J
	jNSJtClx+U3I14wXSPoPxaIS7qWl1GSmLClzj7J17ThuQsjUna9lR5mVuNp+w+52hAdtys8qZjFXI
	BGTjVfScPMhdXGhgD+6OqVso7eVqum7kQ9caWEN6FyNQVi8Ew7PPn2kRVExGNOH6k3TkJgQAo7+KV
	6RPnIwun+jttBRXxH5P+gGuX4eDakGjqdbZ3lJisFJ37mzWuVhdAsqvFE/ERlkxiLK8036MbTuSOr
	gy1gWVgkQjkMhHU3cfLy2Sl24mtdhFWPfQKoMO9EPjhfzhjzWt2fAEDsQp38mjXd2Q3xr9UnaqWE4
	HG8zLE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0UY-00000006tIa-3UB2;
	Mon, 16 Feb 2026 15:26:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0U3-00000006tEZ-20tE;
	Mon, 16 Feb 2026 15:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51F76417D3;
	Mon, 16 Feb 2026 15:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1B7C116C6;
	Mon, 16 Feb 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255556;
	bh=vDRtpAkL1bnKQgVXh7lQ/WNyK2vOaJ7GqBnIwfLExZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOVNsyRqJvlzFkG//5rB0ckYaEEUnPwm/t7YDyB3POV6NQTluEW4+iPIY7fXEFYvI
	 l8gqFXae2lMHa/PIlGOHNxNQdlcBdyBjs4xOX/tkoNRwpBucuhIh9U2TDXCgZtC7yU
	 Uooq4Wh7GbucBpvboGWR9BPGV5V1yWX6Qzx0ov94SaGcTs87TfwOKpFnpymwX8fifx
	 SjSVCXs0iZ5/zZ3BY2nKmH/gSOaAfhLvedBkd0fFFp3D0wtXrTHYEvtBp6CUwkhD4O
	 IKFL4v77u6nzP72AY3DFsgT/CH/i5KeCd8Ut23A8l6rggkw+j7+Z2Q+W6i69xIVlEq
	 5bbOS9QglDO5A==
Date: Mon, 16 Feb 2026 09:25:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072559_563446_DCCF2A9C 
X-CRM114-Status: GOOD (  50.84  )
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

On Mon, Feb 16, 2026 at 09:58:35AM +0100, Alexander Wilhelm wrote:
> On Sat, Feb 14, 2026 at 03:16:55PM -0600, Bjorn Andersson wrote:
> > When encoding QMI messages, the "source buffer" is a C-struct in the
> > host memory, so while the data that goes into the outgoing buffer should
> > be converted to little endian, the length should not be.
> > 
> > Commit 'fe099c387e06 ("soc: qcom: preserve CPU endianness for
> > QMI_DATA_LEN")' fixed this, but did it by copying a whole word from the
> > source into a local u32 and then operated on that.
> > 
> > If the length in the DATA_LEN refers to either a char or short array,
> > it's reasonable to expect that the struct is packed such that this word
> > will contain not only the length-byte (or length-short), but also the
> > beginning of the payload.
> > 
> > As the encoder loops around to encode the payload it runs into an
> > unreasonable value of "data_len_value" and bails, with the error message
> > "qmi_encode: Invalid data length".
> > 
> > Rather then complicating the logic with local variables of different
> > types we can instead pick the u8 or u16 "data_len_value" directly from
> > "buf_src". As "buf_src" refers to a typical C-structure in the client
> > drivers, we expect this field to be naturally aligned.
> > 
> > We can then return to the original expression of qmi_encode_basic_elem()
> > encoding directly from "src_buf" to "dst_buf", with the endianness
> > conversion, based on the size of the type.
> > 
> > Reported-by: David Heidelberg <david@ixit.cz>
> > Closes: https://urldefense.com/v3/__https://lore.kernel.org/all/dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz/__;!!I9LPvj3b!BCfk4-YtwbkEy3mc_UUojT1xCH5BW5COilqBek1tBnJyWzp2eK716Cj0C_35FQwo8__BS8qk_PK5oJs9i719BCjcA-rnMg3YY71aTHHs$ 
> > Fixes: fe099c387e06 ("soc: qcom: preserve CPU endianness for QMI_DATA_LEN")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/qmi_encdec.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> > index 28ce6f130b6ac355820bb295c8c96f9c6a6e385f..45bb26d010da77ab8d481897026b718c2290bad7 100644
> > --- a/drivers/soc/qcom/qmi_encdec.c
> > +++ b/drivers/soc/qcom/qmi_encdec.c
> > @@ -368,8 +368,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  	const void *buf_src;
> >  	int encode_tlv = 0;
> >  	int rc;
> > -	u8 val8;
> > -	u16 val16;
> >  
> >  	if (!ei_array)
> >  		return 0;
> > @@ -406,7 +404,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  			break;
> >  
> >  		case QMI_DATA_LEN:
> > -			memcpy(&data_len_value, buf_src, sizeof(u32));
> 
> Hi Bjorn,
> 
> unfortunatelly, this change breaks the `ath11k`, and most likely `ath12k`,
> execution on big-endian platforms:
> 
>     ath11k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath11k_pci 0001:01:00.0: MSI vectors: 1
>     ath11k_pci 0001:01:00.0: qcn9074 hw1.0
>     ath11k_pci 0001:01:00.0: FW memory mode: 0
>     ath11k_pci 0002:01:00.0: BAR 0: assigned [mem 0xc10000000-0xc101fffff 64bit]
>     ath11k_pci 0002:01:00.0: MSI vectors: 1
>     ath11k_pci 0002:01:00.0: qcn9074 hw1.0
>     ath11k_pci 0002:01:00.0: FW memory mode: 0
>     ath11k_pci 0001:01:00.0: invalid memory segment length: 83886080
>     ath11k_pci 0001:01:00.0: invalid memory segment length: 419430400
>     ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 0
>     ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
>     ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 48
>     ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
>     ath11k_pci 0002:01:00.0: invalid memory segment length: 83886080
>     ath11k_pci 0002:01:00.0: invalid memory segment length: 419430400
>     ath11k_pci 0002:01:00.0: qmi respond memory request failed: 1 0
>     ath11k_pci 0002:01:00.0: qmi failed to respond fw mem req: -22 
> 
> I tried to analyze the regression I introduced and I think I now understand
> what went wrong. Previously, the code looked like the this:
> 
>     memcpy(&data_len_value, buf_src, temp_ei->elem_size);

Above log indicates that we have a problem on the decode-side. This
patch 1, changes the encoder side only. But we might have the same bug
in both cases(?)...

> 
> However, this never worked correctly on big‑endian systems. `buf_src` is a
> `void *`, but `ath11k` and `ath12k` always store the data as `u32`.

This I think is the actual bug.

Based on the "invalid memory segment length" error, I can see we're
talking about struct qmi_wlanfw_request_mem_ind_msg_v01.

This defined mem_seg_len as an u32, 

But qmi_wlanfw_request_mem_ind_msg_v01_ei[] tells us that it's an u8
(elem_size = 1).

> Assume
> the element value is `0xABCD` with an elem_size of 2, that is, the
> `sizeof(u16)`. The memory layout on the driver side then looks like this (X
> marks unused bytes):
> 
>     +---------------+----+----+----+----+
>     | Little Endian | XX | XX | AB | CD |
>     +---------------+----+----+----+----+
>     | Big Endian    | CD | AB | XX | XX |
>     +---------------+----+----+----+----+
> 
> When `buf_src` is treated as an array of `u32` and then “reinterpreted” as
> an array of `u8`, only the first 2 bytes of the `u32` are copied, which, on
> big‑endian, no longer contain the actual data. After the copy,
> `data_len_value` contains the following data:
> 
>     +---------------+----+----+----+----+
>     | Little Endian | XX | XX | AB | CD |
>     +---------------+----+----+----+----+
>     | Big Endian    | XX | XX | XX | XX |
>     +---------------+----+----+----+----+
> 
> So the original value `0xABCD` never gets copied at all on big‑endian
> systems. This is why a simple pointer cast cannot work reliably on
> big‑endian architectures. I did the following change:
> 

You're analysis is correct!

An incoming 0xcd will be written as 0xcd000000 in the 32-bit
mem_seg_len. This is confirmed by your log, which actually are the
values 5 and 25.

Looking further, I see that qmi_wlanfw_host_cap_req_msg_v01_ei[]
contains "gpios_len", which is declared as sizeof(u8), but gpios_len is
u32. So the ath11k driver has the same problem on the encode side.

In contrast, you can see struct ssctl_subsys_event_req which defines
subsys_name_len as u8 and ssctl_subsys_event_req_ei[0] specified
elem_size of sizeof(uint8_t) - which is the source of the bug that David
reported.

>     memcpy(&data_len_value, buf_src, sizeof(u32));
> 
> My attempt was to always copy the full `u32` value , but it seems that the
> modem on the "Pixel 3" does not actually use a `u32` there, but rather an
> array or a packed structure. I’ve CC’ed Jeff and the `ath11k/ath12k`
> mailing list as well. Hopefully we can find a solution that works across
> both endianness architectures.
> 

This isn't just the modem on Pixel 3, that message is sent on a wide
variety of Qualcomm SoCs.

> >  			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
> >  					sizeof(u8) : sizeof(u16);
> >  			/* Check to avoid out of range buffer access */
> > @@ -416,19 +413,16 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
> >  				       __func__);
> >  				return -ETOOSMALL;
> >  			}
> > -			if (data_len_sz == sizeof(u8)) {
> > -				val8 = data_len_value;
> > -				rc = qmi_encode_basic_elem(buf_dst, &val8,
> > -							   1, data_len_sz);
> > -				if (rc < 0)
> > -					return rc;
> > -			} else {
> > -				val16 = data_len_value;
> > -				rc = qmi_encode_basic_elem(buf_dst, &val16,
> > -							   1, data_len_sz);
> > -				if (rc < 0)
> > -					return rc;
> > -			}
> > +
> > +			if (data_len_sz == sizeof(u8))
> > +				data_len_value = *(u8 *)buf_src;
> > +			else
> > +				data_len_value = *(u16 *)buf_src;
> > +
> > +			rc = qmi_encode_basic_elem(buf_dst, buf_src, 1, data_len_sz);
> 
> Here is the problem again: `buf_src` is once more being cast either to a
> `u8 *` or a `u16 *`. This does not cause issues on little‑endian systems,
> but it corrupts the data on big‑endian platforms.
> 

Correct, but prior to 3ced38da5f7d ("soc: qcom: QMI encoding/decoding
for big endian") only temp_ei->elem_size bytes of buf_src was
considered. I.e. for a elem_size of 1, only the byte pointed to by
buf_src was considered to be the length - and this happens to be the
same thing with little endian.

And as the commit message of this patch states, if we change this to
always read 32-bits from the length we're likely reading "garbage"
beyond the u8 or u16 length member.


It might very well be that the underlying bug is my expectation that
elem_size should be reflected in the struct and not only in the encoded
message, and hence what I wrote in https://github.com/linux-msm/qmic.
Perhaps the length-specifier of an array should always be u32?

@Chris, what does the downstream generator produce here?

Regards,
Bjorn

> 
> Best regards
> Alexander Wilhelm

